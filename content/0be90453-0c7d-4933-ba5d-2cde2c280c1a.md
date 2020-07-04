# Writing Stubernetes' ignition compiler / Stushiba stuff 2020-06-25

installing `jo` from AUR to make the ignition file

installing `expect` to get `mkpasswd`

oh wait, this is the wrong mkpasswd

## abandoned jo implementation

I ended up deciding I'd rather use a heredoc after writing these lines:

```bash
# this script assumes you have the `jo` utility installed:
# https://github.com/jpmens/jo

>ignition/config.ign jo ignition='{ "version": "3.1.0" }' \
  passwd='{"users":'$(jo name=stuart password="$passhash" \
    sshAuthorizedKeys=$(curl -s https://github.com/stuartpb.keys | jo -a))'}'
```

## cut password-setting lines

won't be needing these lines since I'm adding myself to `sudo` instead of `wheel`:

```bash
# at the beginning of the script we prompt for password entry
passhash=$(openssl passwd -6)
```

and later, in the heredoc

```
        "passwordHash": "$passhash",
```
