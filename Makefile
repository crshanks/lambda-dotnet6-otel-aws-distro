STACK_NAME=sam-lambda-dotnet6-otel-aws-distro

.PHONY: build

build:
	sam build

deploy: build
	$(info Executing sam deploy...no echo")
	@sam deploy \
		--capabilities CAPABILITY_NAMED_IAM \
		--parameter-overrides "newRelicLicenseKey=${NEW_RELIC_LICENSE_KEY}" "newRelicEndpoint=otlp.nr-data.net:4317" \
		--resolve-s3 \
		--stack-name "${STACK_NAME}" \
		--profile default \
		--region eu-west-2

