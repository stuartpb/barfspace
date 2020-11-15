# work I actually lost in Mk 1

note: this is written *before* I destroy the workspace, so I have full awareness I'm losing this:

- A file in the root "notes" volume folder that listed the GitHub password for the PUF in plaintext.
  - Not only was it something lame I don't want to remember, I'd rather have the PUF be NilPass protected until I can get something a *little* more secure/trusted around it.
    - Also, the need for the PUF construct has diminished since I realized I ought to just set up a password-protected keypair within the workspace
      - and I can decide how many levels of configuration / defense I want on this system
        - ie. to have a secret key in a "secret" PV that is not itself password-protected, but is stored on a volume that is encrypted at rest
          - and requires access to a frontend protected behind an auth proxy

## VS Code tweaks

"Configure trusted domains" and set it to trust all domains / disable link protection

Might be nice to only have that apply in Markdown, when I can see
