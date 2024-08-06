#!/usr/bin/env bash
set -euo pipefail

function main {
    sudo mkdir -p /srv/public
    sudo apt-get install samba minidlna

    sudo cp ./minidlna/minidlna.conf /etc/minidlna.conf
    sudo systemctl restart minidlna.service

    sudo cp ./samba/smb.conf /etc/samba/smb.conf
    sudo systemctl restart smbd.service
}

main "$@"
