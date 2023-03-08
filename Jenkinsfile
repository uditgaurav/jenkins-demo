pipeline {
    agent any
    
    environment {
        HCE_ENDPOINT = 'http://a443010664b8e40de81dc327e1250566-1396626662.ap-northeast-1.elb.amazonaws.com:9091'
        ACCESS_ID    = 'adminjIDxn'
        ACCESS_KEY    = 'iWctPnYqomPKkfW'
        PROJECT_ID    = '96032030-45b3-4f13-b443-83fc6efd2a75'
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
                    sh scripts/verify-resilience-score.sh
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
