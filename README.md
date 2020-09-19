# FileArchiveCleaner
Clean out older files of any filearchive

# How to use

There are two ENV vars to set:
 - CLEANER_CRON_EXPRESSION - this one expecs a valid CRON expression - The crontimer to run the cleanup job
 - GRACE_PERIOD_IN_MINUTES - Files older than this number in minutes get deleted - The period of data to keep

The data to be uploaded should be mounted at /data.

## Example
```yaml
docker run --name=mycleaner -e CLEANER_CRON_EXPRESSION='*/15 * * * *' -e GRACE_PERIOD_IN_MINUTES="60" -v /some/data/path/on/host:/data -d robhofmann/filearchivecleaner
```
