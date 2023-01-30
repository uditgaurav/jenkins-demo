pipeline {
    agent any
    
    environment {
        HCE_ENDPOINT = 'http://a443010664b8e40de81dc327e1250566-1396626662.ap-northeast-1.elb.amazonaws.com:9091'
        ACCESS_ID    = 'adminjIDxn'
        ACCESS_KEY    = 'iWctPnYqomPKkfW'
        PROJECT_ID    = '96032030-45b3-4f13-b443-83fc6efd2a75'
        WORKFLOW_ID    = '32a37c70-2be2-41bd-9817-52dbd820ec3f'
        APP_URL = "http://35.72.33.73:30001/"
                        
    }

    stages {

        stage('Run Chaos Experiment') {
            steps {
                 sh '''
                    sh scripts/launch-chaos.sh
                 '''
                 
                 sh '''
                    sh scripts/monitor-chaos.sh
                 '''
                 
                 sh '''
                    sh scripts/verify-rr.sh
                 '''
            }
        }
    }
}
