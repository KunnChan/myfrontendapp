pipeline {
    agent any
    environment {
        S3_BUCKET = "my-frontend-app-${env.BRANCH_NAME}"
        DISTRIBUTION_ID = credentials('cloudfront-distribution-id') // optional
    }

    tools {
        nodejs 'NodeJS 22'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Install & Build') {
            steps {
                sh 'npm install'
                sh 'npm run build'
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

        stage('Invalidate CloudFront') {
            when {
                branch 'dev'
            }
            steps {
                sh '''
                    aws cloudfront create-invalidation \
                      --distribution-id $DISTRIBUTION_ID \
                      --paths "/*"
                '''
            }
        }
    }

    post {
        failure {
            mail to: 'hi@thedevbranch.com',
                 subject: "React Dev Build Failed: ${env.BRANCH_NAME}",
                 body: "Build failed. Check Jenkins logs."
        }
    }
}
