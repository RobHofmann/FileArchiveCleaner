#!/bin/bash

# Make sure CRON is being setup
if [[ -n "$CLEANER_CRON_EXPRESSION" ]]; then
  ln -sf /proc/$$/fd/1 /var/log/stdout
  service cron start
	if [[ -n "$CLEANER_CRON_EXPRESSION" ]]; then
        echo "$CLEANER_CRON_EXPRESSION /scripts/runCleaner.sh $GRACE_PERIOD_IN_MINUTES >/var/log/stdout 2>&1" > /etc/crontab
	fi
	crontab /etc/crontab
fi

# Tail to let the container run
tail -f /dev/null