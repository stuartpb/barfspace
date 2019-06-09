# stuvern (Digital Ocean droplet) changelog

- after sshing in to root with the password emailed to me, I ran `pacman -Syu` and, when that failed, followed the directions at https://www.archlinux.org/news/binaries-move-to-usrbin-requiring-update-intervention/ because the starting Arch image was from May
- `useradd -m -g users -G wheel -s /bin/bash stuart; chfn stuart; passwd stuart`
- `EDITOR=nano visudo`, uncomment `%wheel ALL=(ALL) ALL`
- log in as stuart
- append ssh public keys to ~/.ssh/authorized_keys
- `bash <(curl aur.sh)` packer
- remove netcfg

## TURN server

- create and mount 4GB swapfile for building
- build and install rethinkdb
- install redis
  - I did this mostly for the redis-cli to monitor other redis instances
- install libmariadbclient
  - I did this to satisfy the libmysqlclient requirement of rfc5766-turn-server
- build and install rfc5766-turn-server
- install bash-completion
- `sudo cp /usr/share/turnserver/examples/etc/turnserver.conf /etc/`
- `sudo cp /usr/share/turnserver/examples/etc/turnuserdb.conf /etc/`
- add user line to /etc/turnserver.conf
