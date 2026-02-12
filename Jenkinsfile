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
                checkout scm
            }
        }

        stage('Package Lambda') {
            steps {
                sh '''
                echo "Packaging Lambda..."
                rm -f lambda.zip
                zip lambda.zip lambda_function.py
                '''
            }
        }

        stage('Deploy Lambda') {
            steps {
                sh '''
                echo "Updating Lambda..."
                aws lambda update-function-code \
                --function-name $FUNCTION_NAME \
                --zip-file fileb://lambda.zip \
                --region $AWS_DEFAULT_REGION
                '''
            }
        }

        stage('Deploy API Gateway') {
            steps {
                sh '''
                echo "Deploying API Gateway..."
                aws apigateway create-deployment \
                --rest-api-id $API_ID \
                --stage-name prod \
                --region $AWS_DEFAULT_REGION
                '''
            }
        }
    }
}

