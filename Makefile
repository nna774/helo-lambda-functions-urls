STACK_NAME := helo-lambda-functions-urls

REGION := ap-northeast-1
BUCKET := nana-lambda

all: app deploy

app:
	GOOS=linux GOARCH=amd64 go build -o $(STACK_NAME)

deploy:
	sam deploy --region $(REGION) --s3-bucket $(BUCKET) --capabilities CAPABILITY_IAM --template-file template.yml --stack-name $(STACK_NAME)

.PHONY: app deploy
