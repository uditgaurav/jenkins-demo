#!/bin/bash
curl -L https://github.com/uditgaurav/hce-api-template/releases/download/0.1.0-saas/hce-api-linux-amd64 -o hce-api

chmod +x hce-api

./hce-api-saas generate --api launch-experiment --account-id=${ACCOUNT_ID} \
--project-id ${PROJECT_ID} --workflow-id ${WORKFLOW_ID} \
--api-key ${API_KEY} --file-name hce-api.sh
