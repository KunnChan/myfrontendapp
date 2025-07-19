pipeline {
    agent any
    environment {
        S3_BUCKET = "myreactapp-34344545-${env.BRANCH_NAME}"
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

        stage('Upload to S3') {
            when {
                branch 'dev'
            }
            steps {
                sh 'aws s3 sync dist/ s3://$S3_BUCKET/ --delete'
            }
        }
    }

    post {
        failure {
            mail to: "${TO_EMAIL}",
                 subject: "React Dev Build Failed: ${env.BRANCH_NAME}",
                 body: "Build failed. Check Jenkins logs."
        }
    }
}
