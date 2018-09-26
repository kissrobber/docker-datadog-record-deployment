#!/bin/sh
set -e
ENV=${1##*/}
echo "recording $ENV"
curl  -X POST -H "Content-type: application/json" \
-d "{
      \"title\": \"$ENV-deploy of $PROJECT\",
      \"text\": \"Datadog Deploy Events at Deployments\",
      \"priority\": \"normal\",
      \"tags\": [\"environment:$ENV\"],
      \"alert_type\": \"info\"
  }" \
"https://api.datadoghq.com/api/v1/events?api_key=$DATADOG_API_KEY"
