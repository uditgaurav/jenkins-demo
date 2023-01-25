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
                    sh scripts/pre-chaos-check-url.sh
                 '''
            }
        }

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
        stage('Post-App-Check') {
            steps {
                 sh '''
                    sh scripts/post-chaos-check-url.sh
                 '''
            }
        }
    }
}
