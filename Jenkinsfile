pipeline {
    agent any
    
    environment {
        ACCOUNT_ID = 'cTU1lRSWS2SSRV9phKvuOA'
        API_KEY    = 'pat.cTU1lRSWS2SSRV9phKvuOA.64228498bfaff60df53f385b.cATd1pTv7UwOwS1XVvYj'
        PROJECT_ID   = 'ChaosTestinProd2'
        WORKFLOW_ID    = '9bd2855f-b822-464c-9906-0f9ebe824cc6'
        APP_URL = "https://www.google.com"
                        
    }

    stages {
        
//         stage('Pre-App-Check') {
//             steps {
//                  sh '''
//                     sh scripts/pre-chaos-check-url.sh
//                  '''
//             }
//         }

        stage('Launch Chaos Experiment') {
            steps {
                 sh '''
                    sh scripts/launch-chaos.sh
                 '''
                 
//                  sh '''
//                     sh scripts/monitor-chaos.sh
//                  '''
                 
//                  sh '''
//                     sh scripts/verify-rr.sh
//                  '''
            }
        }
//         stage('Post-App-Check') {
//             steps {
//                  sh '''
//                     sh scripts/post-chaos-check-url.sh
//                  '''
//             }
//         }
    }
}
