#!/bin/bash

cd `dirname $0`/..
SERVICE_ROOT=`pwd`

for j in `find $SERVICE_ROOT/lib/default -name '*.jar' -print`; do
  CLASSPATH="$CLASSPATH":$j
done

if [ -z "$JVM_OPTS" ]; then
  JVM_OPTS="-Xmx256M"
fi

if [ -z "$BB_ENV" ]; then
  BB_ENV="development"
fi

exec java -Dbb.env=$BB_ENV -Dlog4j.configuration=file:$SERVICE_ROOT/config/log4j_$BB_ENV.properties $JVM_OPTS -cp $CLASSPATH bballant.BasicWebServer "$@"
