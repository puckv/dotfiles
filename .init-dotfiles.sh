#!/bin/bash

# Replace tarsnapper.yml to use absolute paths
sed -i.bak "s#~/#${HOME}/#g" ~/.tarsnap/tarsnapper.yml
rm ~/.tarsnap/tarsnapper.yml.bak

# Install tarsnapper cron entry
CRON_ENTRY='52 * * * * PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin tarsnapper -c $HOME/.tarsnap/tarsnapper.yml make'
if ! crontab -l >/dev/null 2>&1; then
    echo "$CRON_ENTRY" | crontab -
else
    if ! (crontab -l | fgrep -q "$CRON_ENTRY"); then
        (crontab -l 2>/dev/null; echo "$CRON_ENTRY") | crontab -
    fi
fi
