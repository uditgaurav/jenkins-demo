#!/bin/bash
curl -L https://github.com/uditgaurav/hce-api-template/releases/download/0.1.0/hce-api-linux-amd64 -o hce-api

chmod +x hce-api

./hce-api generate --api monitor-experiment --hce-endpoint=${HCE_ENDPOINT} \
--project-id ${PROJECT_ID} --workflow-id ${WORKFLOW_ID} \
--access-key ${ACCESS_KEY} --access-id ${ACCESS_ID} --file-name hce-api.sh
chmod +x hce-api.sh

DELAY=2
RETRY=150
START=0
fileName="hce-api.sh"
i=0
while [ "$i" -le $RETRY ]; do
    i=$(( i + 1 ))
    echo
    res=$(sh $fileName)
    echo
    if [ "$res" = "Succeeded" ]; then
        echo "Experiment completed, CurrentState: $res"
        exit 0
    fi
    sleep $DELAY
    echo "Waiting for experiment completion... CurrentState: $res, retries left: $(($RETRY-$i))"
done

echo "[Error]: Timeout the workflows is not completed with DELAY: $DELAY and RETRY: $RETRY, CurrentState: $res"

exit 1
