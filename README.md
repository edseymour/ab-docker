# ab-docker
Yet another containerised Apache Bench

# Usage:
``` 
docker run edseymour/ab -n 5 -c 1 http://www.yahoo.com/
```

Supports ENVs to provide greater flexibility for run-time environments

 * REQUESTS    - number of requests
 * CONCURRENCY - number of parallel requests
 * URL         - url to test, make sure it ends with a /
 * VERBOSITY   - level of verbosity (optional)
 * TIMELIMIT   - how long to run the test for, overrides REQUESTS (optional)
 * TIMEOUT     - request timeout (optional)"

Note: the ENVs are ignored if command line options are passed, these will be used instead. 

Example OpenShift template to allow users to create on-demand tests
