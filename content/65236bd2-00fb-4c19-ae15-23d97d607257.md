# Configuring Kublam

You configure Kublam by installing it into your cluster with a ConfigMap, obviously.

Let's say it takes a directory of YAMLs, so you can make some of the config Secret

## Things that go in the config

- Credentials and "which app is this" (like Jira/Bugzilla/GitLab/etc) for known endpoints.
  - If you don't include this, Kublam will make a preflight request for the page and look for known identifying meta/link elements or whatever to sniff what interface it could use
- (maybe) Strategies for handling "quickie" annotations

## Things that go in CRDs

- Plans / Roadmaps

## Things that go in annotations

- "Quickies", like "it's because of this issue"

## Things that don't need configuration

- Backend service stuff?
  - Like, can this be detected automatically from env vars?
    - Might need to configure which env var to use
    - Or you could just set it to the DNS name for the service
      - Wouldn't mind a version that doesn't rely on cluster DNS tho
