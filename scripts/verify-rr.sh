#!/bin/bash
curl -L https://github.com/uditgaurav/hce-api-template/releases/download/0.1.0/hce-api-linux-amd64 -o hce-api

chmod +x hce-api

./hce-api generate --api validate-resilience-score --hce-endpoint=${HCE_ENDPOINT} \
--project-id ${PROJECT_ID} --workflow-id ${WORKFLOW_ID} \
--access-key ${ACCESS_KEY} --access-id ${ACCESS_ID} --file-name hce-api.sh
chmod +x hce-api.sh

# Tunables provide your values
expectedProbeSuccessPercentage=100
fileName="hce-api.sh"

# Script execution logic
res=$(bash $fileName)
res=$(echo "$res" | tr -d '"')
echo
if [ "$res" != "$expectedProbeSuccessPercentage" ]; then
    echo "The probe success percentage is: $res, expected probe success percentage: $expectedProbeSuccessPercentage"
    exit 1
fi

echo "The probe success percentage is equal to the expected probe success percentage"
exit 0
