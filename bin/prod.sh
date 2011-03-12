#!/bin/bash

cd `dirname $0`/..
SERVICE_ROOT=`pwd`
LOGDIR=$SERVICE_ROOT/log

export JVM_OPTS='-verbosegc -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -XX:+PrintGCDateStamps -Xms1024M -Xmx1024M'
export MOBILE_ENV="production"

mkdir -p $LOGDIR
exec $SERVICE_ROOT/bin/start.sh "$@" >> $LOGDIR/service.log 2>&1
