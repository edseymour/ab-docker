#!/bin/bash 

# -n 5 -c 1 http://www.yahoo.com/

number=$REQUESTS
concur=$CONCURRENCY
url=$URL
verbose=$VERBOSITY
timeout=$TIMEOUT
timelimit=$TIMELIMIT

cmd=
if [[ "$@" != "" ]] 
then
   echo "command line provided overrides ENVs" 
   cmd=$@
else
   echo "using ENVs
   REQUESTS    : $REQUESTS - number of requests
   CONCURRENCY : $CONCURRENCY - number of parallel requests
   URL         : $URL - url to test, make sure it ends with a /
   VERBOSITY   : $VERBOSITY - level of verbosity (optional)
   TIMELIMIT   : $TIMELIMIT - how long to run the test for, overrides REQUESTS (optional)
   TIMEOUT     : $TIMEOUT - request timeout (optional)"

   cmd="-n $REQUESTS -c $CONCURRENCY"
   [[ "$VERBOSITY" != "" ]] && cmd="$cmd -v $VERBOSITY"
   [[ "$TIMELIMIT" != "" ]] && cmd="$cmd -t $TIMELIMIT"
   [[ "$TIMEOUT" != "" ]] && cmd="$cmd -s $TIMEOUT"
   cmd="$cmd $URL"
fi

echo "**********************************
Test starting $(date) 
**********************************
Running now: ab $cmd"

/usr/bin/ab $cmd

echo "**********************************
Test finished $(date)
**********************************"


