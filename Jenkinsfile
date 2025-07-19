pipeline {
    agent any
    environment {
        S3_BUCKET = "myreactapp-${env.BRANCH_NAME}"
        TO_EMAIL = "hi@thedevbranch.com"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Install & Build') {
            steps {
                timeout(time: 5, unit: 'MINUTES') {
                    sh 'node -v'
                    sh 'npm install'
                    sh 'npm run build'
                }
            }
        }

        stage('Test') {
            steps {
                sh 'npm test'
            }
        }

        stage('Manual Approval') {
            steps {
                input message: "Approve deployment to PRODUCTION?"
            }
        }

        stage('Upload to S3') {
            when {
                branch 'prod'
            }
            steps {
                sh 'aws s3 sync dist/ s3://$S3_BUCKET/ --delete'
            }
        }
    }

    post {
        success {
            mail to: '$TO_EMAIL',
                 subject: "✅ Production Build Success: ${env.BRANCH_NAME}",
                 body: "The production build and deployment were successful."
        }
        failure {
            mail to: '$TO_EMAIL',
                 subject: "❌ Production Build Failed: ${env.BRANCH_NAME}",
                 body: "Something went wrong in production pipeline. Check Jenkins logs."
        }
    }
}
