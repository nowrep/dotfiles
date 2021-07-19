#!/usr/bin/env bash

systemctl --user import-environment WAYLAND_DISPLAY

# ssh-agent
ssh-add ~/.ssh/id_ed25519 ~/.ssh/id_rsa < /dev/null
