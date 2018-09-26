#!/bin/sh
set -e
ENV=${1##*/} # deployment/production -> production
BUILD_NUM=$2
echo "recording $ENV($BUILD_NUM)"
curl  -X POST -H "Content-type: application/json" \
-d "{
      \"title\": \"$ENV-deploy of $PROJECT\",
      \"text\": \"Datadog Deploy Events at Deployments\",
      \"priority\": \"normal\",
      \"tags\": [\"environment:$ENV\", \"build_num:$BUILD_NUM\"],
      \"alert_type\": \"info\"
  }" \
"https://api.datadoghq.com/api/v1/events?api_key=$DATADOG_API_KEY"
