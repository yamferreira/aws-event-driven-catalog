#!/bin/bash
echo "Criando recursos AWS no LocalStack..."

aws --endpoint-url=http://localhost:4566 sns create-topic \
  --name catalog-emit \
  --region us-east-2

aws --endpoint-url=http://localhost:4566 sqs create-queue \
  --queue-name catalog-queue \
  --region us-east-2

aws --endpoint-url=http://localhost:4566 s3 mb \
  s3://catalog-marketplace-adega \
  --region us-east-2

TOPIC_ARN=$(aws --endpoint-url=http://localhost:4566 sns list-topics \
  --region us-east-2 --query 'Topics[0].TopicArn' --output text)

QUEUE_URL=$(aws --endpoint-url=http://localhost:4566 sqs get-queue-url \
  --queue-name catalog-queue \
  --region us-east-2 --query 'QueueUrl' --output text)

QUEUE_ARN=$(aws --endpoint-url=http://localhost:4566 sqs get-queue-attributes \
  --queue-url $QUEUE_URL \
  --attribute-names QueueArn \
  --region us-east-2 --query 'Attributes.QueueArn' --output text)

aws --endpoint-url=http://localhost:4566 sns subscribe \
  --topic-arn $TOPIC_ARN \
  --protocol sqs \
  --notification-endpoint $QUEUE_ARN \
  --region us-east-2

echo "Recursos criados com sucesso!"
echo "Bucket: catalog-marketplace-adega"
echo "SNS Topic ARN: $TOPIC_ARN"
echo "SQS Queue URL: $QUEUE_URL"