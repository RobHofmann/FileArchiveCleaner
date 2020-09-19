FOLDER="/data"
mkdir $FOLDER

GRACE_PERIOD_IN_MINUTES=$1
echo "Grace period: $GRACE_PERIOD_IN_MINUTES"
find $FOLDER -type f -mmin +$GRACE_PERIOD_IN_MINUTES -exec rm -f {} \;