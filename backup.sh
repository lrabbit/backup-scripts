#!/bin/sh

is_mounted() {
  mount | grep /mnt/nas/data > /dev/null 2>&1
}

backup() {
  export PASSPHRASE=`cat /root/.cred`
  duplicity --include /mnt/data/Photos --exclude /mnt/nas/data /mnt/nas/data cf+hubic://backup
  unset PASSPHRASE
}

is_mounted
if [ $? -eq 0 ]
then
  echo "NAS is mounted, backing up..."
  backup
else
  echo "NAS is NOT mounted, aborting..."
fi
