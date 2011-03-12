#!/bin/bash

cd `dirname $0`/..
SERVICE_ROOT=`pwd`

export CLASSPATH=$CLASSPATH:target/classes
exec $SERVICE_ROOT/bin/start.sh "$@"
