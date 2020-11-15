# best practices for curlable bash scripts

a la those meant for meta.sh

inspired by https://sandstorm.io/news/2015-09-24-is-curl-bash-insecure-pgp-verified-install which I (re)discovered via the README for https://github.com/cdr/code-server

- wrap the entire script in a function call so it doesn't start executing until it's fully loaded
