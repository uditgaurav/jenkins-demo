pipeline {
    agent any
    
    environment {
           ACCOUNT_ID = ${env.ACCOUNT_ID}
           API_KEY    = ${env.API_KEY}
           PROJECT_ID    = ${env.PROJECT_ID}
           WORKFLOW_ID    = '9bd2855f-b822-464c-9906-0f9ebe824cc6'
//         APP_URL = "https://www.google.com"
                        
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
