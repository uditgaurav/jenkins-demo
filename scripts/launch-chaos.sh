#!/bin/bash
set -e 

curl --location 'https://app.harness.io/gateway/chaos/manager/api/query?accountIdentifier=cTU1lRSWS2SSRV9phKvuOA' \
--header 'x-api-key: pat.cTU1lRSWS2SSRV9phKvuOA.64228498bfaff60df53f385b.cATd1pTv7UwOwS1XVvYj' \
--header 'Content-Type: application/json' \
--data '{"query":"mutation RunChaosExperiment(\n  $workflowID: String!,\n  $identifiers: IdentifiersRequest!\n) {\n  runChaosExperiment(\n    workflowID: $workflowID,\n    identifiers: $identifiers\n  ) {\n    notifyID\n  }\n}","variables":{"workflowID":"9bd2855f-b822-464c-9906-0f9ebe824cc6","identifiers":{"orgIdentifier":"default","accountIdentifier":"cTU1lRSWS2SSRV9phKvuOA","projectIdentifier":"ChaosTestinProd2"}}}'
