pipeline {
    agent any
    
    environment {
        HCE_ENDPOINT = 'http://aba5dfc5499e34425aada9e2ad9ac6de-488634521.ap-northeast-1.elb.amazonaws.com:9091'
        ACCESS_ID    = 'adminEJZfO'
        ACCESS_KEY    = 'SgyGwfAMavIKZbS'
        PROJECT_ID    = '028d661b-f232-4fc0-84a0-1b34ac12f06c'
        WORKFLOW_ID    = '075921b8-c143-49f2-aa24-099858e2a687'
        APP_URL = "http://35.72.33.73:30001/"
                        
    }

    stages {
        stage('Pre-App-Check') {
            steps {
                 sh '''
                    #!/bin/bash
                    status_code=$(curl -s -o /dev/null -w "%{http_code}" ${APP_URL})
                    if [ "$status_code" != "200" ]; then
                        echo "The pre-chaos app health check is FAILED, status_code: $status_code"
                        exit 1
                    fi
                    echo "The pre-chaos app health check is PASSED, status_code: $status_code"
                    exit 0
                 '''
            }
        }

        stage('Run Chaos Experiment') {
            steps {
                 sh '''
                    #!/bin/bash
                    curl -L https://github.com/uditgaurav/hce-api-template/releases/download/0.1.0/hce-api-linux-amd64 -o hce-api
                    
                    chmod +x hce-api
                    
                    ./hce-api generate --api launch-experiment --hce-endpoint=${HCE_ENDPOINT} \
                    --project-id ${PROJECT_ID} --workflow-id ${WORKFLOW_ID} \
                    --access-key ${ACCESS_KEY} --access-id ${ACCESS_ID} --file-name hce-api.sh

                    chmod +x hce-api.sh
                    
                    ./hce-api.sh
                 '''
                 
                 sh '''
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
                 '''
                 
                 sh '''
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
                 '''
            }
        }
        stage('Post-App-Check') {
            steps {
                 sh '''
                    #!/bin/bash
                    status_code=$(curl -s -o /dev/null -w "%{http_code}" ${APP_URL})
                    if [ "$status_code" != "200" ]; then
                        echo "The post-chaos app health check is FAILED, status_code: $status_code"
                        exit 1
                    fi
                    echo "The post-chaos app health check is PASSED, status_code: $status_code"
                    exit 0
                 '''
            }
        }
    }
}
