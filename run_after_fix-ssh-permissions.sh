#!/bin/sh
# Keys copied from Windows land with 0644 and ssh refuses them; fix on every apply (idempotent).
[ -d "$HOME/.ssh" ] || exit 0
chmod 700 "$HOME/.ssh"
find "$HOME/.ssh" -maxdepth 1 -type f ! -name '*.pub' ! -name 'known_hosts*' -exec chmod 600 {} +
