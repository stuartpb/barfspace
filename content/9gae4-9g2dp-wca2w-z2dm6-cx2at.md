# style best practice I'd like to see a linter / IDE extension enforce

(html attribute) values can be unquoted if they are in the context of an attribute that has no valid values that could violate the rule, ie:

- someone would never need to add quotes when changing it, like adding a second class
- examples:
  - values that can only have one keyword, like `<form method>`.
- counterexamples:
  - `<a href>` is *not* okay, because it could potentially lead to quotes (or a space) being needed to prevent the tag from being interpreted ambiguously as sself-closing

## adjacent idea

- [smart editor](9nynz-h0161-ckah4-3mmyv-sz2m1)
