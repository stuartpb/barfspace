# Lean Notes / Zero to Software Section Incubator

This is a page aggregating thoughts I have on new Lean Notes / Zero to Software content

## Prospective sections

- Getting Feedback
  - I feel like this could probably be folded into Observation and Measurement
- Being Shareable
  - The twin to Being Searchable that includes things like Open Graph and other meta tags that come into play with Twitter cards and Slack and stuff like that.
- Outreach?
  - Outreach is something a lot of other sites cover in depth so I don't really feel like this is worth it.

## Database Design and Rolling Servers

These would be two separate boards, each taking something from "Utilizing Databases" as it currently stands.

Database Design should also take a bit from the last list in Implementing User Accounts.

The notes on MongoDB and RethinkDB and so on should be a single list, with a card for major databases, explaining how/why they're used, and how they map to some of these ideas (eg. you need to duplicate fields in MongoDB because it doesn't have joins, Redis isn't good for big content, etc).

Really, Utilizing Databases should be reworked to be like this, and the more concrete bits should be either moved onto a card or superseded by stuff on a new Rolling Servers board.

Rolling Servers definitely comes after Hosting and Infrastructure, which maaaybe should be renamed.

Rolling Servers would talk a bit about, well, Plushu, as well as maybe 12-factor stuff in general, how every node should be containerizable and portable to another (virtual) host.

Utilizing Databases would then *maybe* come before Implementing User Accounts. Maybe.

## Authorization and Authentication

It would make sense to split Implementing User Profiles up a bit.

Could talk about Passport, Passwordless.js

Also, this could list techniques for verifying a domain, as used by CloudFlare, MailChimp, and GWT. (Acting in the Ecosystem, Being Searchable and Being Shareable will have notes on that.)

## The Human Layer

From the stuff I wrote in Keep:

Codeless Solutions should be changed to Tool-Based Solutions and Developing Without Coding

Developing Without Coding should be called something like The Human Layer, which is similar to Human Components but it's an entirely different angle

Code Switching is something humans do naturally

"Human Components" should probably be renamed "Manual Intervention" or even just Manual Components
