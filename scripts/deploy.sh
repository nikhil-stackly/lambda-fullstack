#!/bin/bash

echo "🚀 Packaging Lambda..."

# old zip delete (optional but clean)
rm -f lambda.zip

# ONLY python file zip cheyyi
zip lambda.zip lambda_function.py

echo "☁️ Updating Lambda function..."

FUNCTION_NAME="lambda-apigateway-demo"
API_ID="21z5lj6skh"
REGION="us-east-1"

# Lambda update
aws lambda update-function-code \
  --function-name $FUNCTION_NAME \
  --zip-file fileb://lambda.zip \
  --region $REGION

echo "🌍 Deploying API Gateway..."

aws apigateway create-deployment \
  --rest-api-id $API_ID \
  --stage-name prod \
  --region $REGION

echo "✅ Deployment Finished"

