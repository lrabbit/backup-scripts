#!/bin/sh

export PASSPHRASE=`cat /root/.cred`
duplicity list-current-files cf+hubic://backup
unset PASSPHRASE