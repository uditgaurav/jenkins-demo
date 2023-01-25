#!/bin/bash
status_code=$(curl -s -o /dev/null -w "%{http_code}" ${APP_URL})
if [ "$status_code" != "200" ]; then
    echo "The pre-chaos app health check is FAILED, status_code: $status_code"
    exit 1
fi
echo "The pre-chaos app health check is PASSED, status_code: $status_code"
exit 0
