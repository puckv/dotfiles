#!/bin/bash

# Restrictive permissions for sensitive files
chmod 700 ~/.gnupg ~/.ssh
chmod 600 ~/.ssh/*

# Replace tarsnapper.yml to use absolute paths
sed -i.bak "s#~/#${HOME}/#g" ~/.tarsnap/tarsnapper.yml
rm ~/.tarsnap/tarsnapper.yml.bak

# Install tarsnapper cron entry
CRON_ENTRY='04 * * * * PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin tarsnapper -c $HOME/.tarsnap/tarsnapper.yml make >/dev/null 2>&1 || echo "Tarsnapper failed"'
if ! crontab -l >/dev/null 2>&1; then
    echo "$CRON_ENTRY" | crontab -
else
    if ! (crontab -l | fgrep -q "$CRON_ENTRY"); then
        (crontab -l 2>/dev/null; echo "$CRON_ENTRY") | crontab -
    fi
fi
