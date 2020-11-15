# General Data Formatting Note Hub

this is in terms of "formats worth knowing, or at least knowing about". not a comprehensive list, except in places where a lot of these formats keep kind of missing each other and really ought to recognize what's around in prior art

so yeah, that's the real point of this section: understanding prior art and the state of the art. Kind of a mission statement for the Lean Notes branch in general, really

see also [Schema State-of-the-Art](93gsh-tg5pd-83b8j-wyd50-a41we)

## binary schemaful containers

- Protobufs
- Cap'n Proto
- [SBE](https://github.com/real-logic/simple-binary-encoding)
- [FlatBuffers](https://google.github.io/flatbuffers/flatbuffers_guide_tutorial.html)
  - [comparison issue](https://github.com/google/flatbuffers/issues/2)
    - they say Cap'n Proto is less flexible

[2019 comparison blog post](https://speice.io/2019/09/binary-format-shootout.html)

## binary schemaless container structures

- [FlexBuffers](https://google.github.io/flatbuffers/flexbuffers.html)
  - [HN thread on FlexBuffers](https://news.ycombinator.com/item?id=23588558)
    - [reply tree by kentonv](https://news.ycombinator.com/item?id=23589132)
- MessagePack
- BSON
- CSON? What's the IETF-standards-track one

## key-value (tree) binary package structures

- HTTP/2 request headers
- tarballs
- ZIP

## generic structures (text-safe)

- Bencode / Netstrings
- MIME multipart
- YAML, JSON
- TOML

## text-safe header-plus-body formats

- HTTP/1.1 request frames
  - CGI
- Markdown with frontmatter (Jekyll-style)

## lossy compressed image formats

- WebP
- Good old JPG

## lossless compressed image formats

- FLIF
  - Can be made lossy?
- Good old PNG
  - Bad old GIF

## text-safe image formats

- XBF2

## Vector image formats

- SVG

## what

- [Bauer Code](g4gjt-x4c55-mt9wy-dn1vd-jg9ge)
