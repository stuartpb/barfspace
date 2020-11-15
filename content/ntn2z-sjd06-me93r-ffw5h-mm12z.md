# boneyard for issue

From my GitHub issue proposing stuff for the random operator

## the stuff

**Is your feature request related to a problem? Please describe.**

I have an application I want to generate a SHARED_SECRET for (Pomerium). Pomerium specifically needs a 256-bit key for this, and it expects that the value of

With secret-generator as it is currently constituted, I can't generate this key: either I set a length of `"40"` and it says that 30 bytes is too short, I set a length of `"44"` and it tells me that 33 bytes is too long, or I set a length between the two and it tells me the Base64 is malformed.

**Describe the solution you'd like**

The main shortcoming of the current system underlying this problem is that the `length` always refers to the length of the generated *string*, not the length of the byte sequence *encoded by* that string. Even in situations where the underlying binary data of the secret doesn't matter, it can helpful to calculate strength in terms of bits of randomness, which is why I propose recognizing a `B` suffix for secret sizes specified in bytes, similar to how other resources can be specified in Kubernetes with a distinguishing suffix to change their meaning (such as the `m` suffix on CPU requests/limits, which specifies core values in millicores).

---
, which is why I propose a `secret-generator.v1.mittwald.de/unit` annotation that can either be `bytes` or `digits`, where the former means that the value of `length` defines the bytes that are encoded, and the latter matches the current behavior of `length` (ie. number of characters in the encoded string).

(on `raw`) For this encoding, the value of `unit` would of course be equivalent for both the `digits` and `bytes` values.
---

That resolves my current use case: however, there are many other applications for Secrets, and many of them expect their random secret data to be encoded in another form than a Base64 string (which is, itself, encoded into Base64 again in the `data` field of the `Secret`). As such, I also propose a `secret-generator.v1.mittwald.de/encoding` annotation, which can generate secrets for all of these applications:

- Systems that take key material directly from a file could use an encoding type of `raw` (as they are still encoded as Base64 internally by Kubernetes).
- other encodings could be specified to use different representations for the underlying random bits, while also serving as a shorthand for the character set when specifying a non-`B`-suffixed length:
  - `base10` (digits)
  - `hex` / `base16` (hexadecimal)
  - `base32` (homograph-avoidant lowercase alphanumeric set)
  - `base36` (full lower-case alphanumeric set)
  - `base62` (full alphanumeric set, a la Sprig's `randAlphaNum`)
  - `base64url` (URL-safe characters)
  - `ascii85` (full ASCII, a la Sprig's `randAscii`)

**Describe alternatives you've considered**

The most flexible form of `encoding` would be to let the user specify their own "alphabet" for converting binary values to arbitrary digit systems. However, this much fine-tuned control over a random secret, at this level of the cluster, would most likely: even the most sensitive of differences can generally be solved with one of the encodings, or a common variation thereof (ie. Douglas Crockford's version of Base32).

For lengths, I originally considered a separate `unit` annotation that could be either `bytes` or `digits`. However, not only would the former be a lot of annotation bloat for a pretty trivial change, it would also result in a false compatibility: if a document needing a 32-byte base64-encoded string were deployed to a cluster where an older version of the secret-generator were deployed, rather than failing to generate the secret (as it wouldn't recognize the length) and potentially leaving that up to a different component of the system (ie. one that tries to unseal secrets that couldn't be randomly generated), it would *misinterpret* the length value, and generate a secret of the wrong size (which may even result in the secret being unparseable).

I also considered an alternative `bytes` annotation that would be mutually exclusive to `length`. However, on top of this also being a certain amount of annotation bloat (with a confusing distinction between the two annotations), this has no clear way to extend the annotation values if the value of `autogenerate` is a comma-separated list, where each key may have a different encoding or length. With the proposed design, both `encoding` and `length` could potentially be extended out to comma-separated lists in the future as well, where the first `length` or `encoding` refers to the first key of `autogenerate`, the second describing the second key, etc. (If this extension were implemented, their behavior when the lists are not the same length would need to be defined: such consideration is out of scope for this proposal.)

---

Rather than having a separate annotation that redefines the meaning of "length", there could be a separate "bytes" annotation that is mutually-exclusive with it. However, I believe the `unit` approach matches the way annotations currently work with this operator, where the presence of one annotation reflects on the state of others (the "secure" annotation declaring whether or not the generated identifier is crypto-random, for example).

Furthermore, when `autogenerate` is a comma-separated string, it's not clear how a user would specify different values for their encoding or lengths in a scenario where one's length should be specified in bytes, and another should be specified in digits. With this, a comma-separated series could specify a different unit value

It could also be possible to let `length` be specified in bytes by using that as a trailing unit, ie. "32B". In this case, it's important to only recognize a capital "B", as a lowercase "b" should technically be recognized as "bit".

This would also extend out, at least in theory, to generating very large secrets in the kilobytes or megabytes.
