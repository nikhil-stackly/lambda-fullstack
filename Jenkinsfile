pipeline {

    agent any

    environment {
        AWS_DEFAULT_REGION = "us-east-1"
        FUNCTION_NAME = "lambda-apigateway-demo"
        API_ID = "21z5lj6skh"
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/nikhil-stackly/lambda-fullstack.git'
            }
        }

        stage('Install AWS CLI') {
            steps {
                sh '''
                sudo apt update
                sudo apt install awscli zip -y
                '''
            }
        }

        stage('Package Lambda') {
            steps {
                sh '''
                rm -f lambda.zip
                zip lambda.zip lambda_function.py
                '''
            }
        }

        stage('Deploy Lambda') {
            steps {
                sh '''
                aws lambda update-function-code \
                --function-name $FUNCTION_NAME \
                --zip-file fileb://lambda.zip
                '''
            }
        }

        stage('Deploy API Gateway') {
            steps {
                sh '''
                aws apigateway create-deployment \
                --rest-api-id $API_ID \
                --stage-name prod
                '''
            }
        }
    }
}
