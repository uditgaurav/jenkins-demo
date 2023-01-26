pipeline {
    agent any
    
    environment {
        HCE_ENDPOINT = 'http://aba5dfc5499e34425aada9e2ad9ac6de-488634521.ap-northeast-1.elb.amazonaws.com:9091'
        ACCESS_ID    = 'adminEJZfO'
        ACCESS_KEY    = 'SgyGwfAMavIKZbS'
        PROJECT_ID    = '028d661b-f232-4fc0-84a0-1b34ac12f06c'
        WORKFLOW_ID    = '94d0e841-0bcb-476e-aa84-8892b78a9efd'
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
