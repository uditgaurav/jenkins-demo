#!/bin/bash
curl -L https://github.com/uditgaurav/hce-api-template/releases/download/0.1.0/hce-api-linux-amd64 -o hce-api

chmod +x hce-api

./hce-api generate --api launch-experiment --hce-endpoint=${HCE_ENDPOINT} \
--project-id ${PROJECT_ID} --workflow-id ${WORKFLOW_ID} \
--access-key ${ACCESS_KEY} --access-id ${ACCESS_ID} --file-name hce-api.sh

chmod +x hce-api.sh

./hce-api.sh
