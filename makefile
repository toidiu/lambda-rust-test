
release:
	cargo build --release --target x86_64-unknown-linux-musl

all: zip create

test:
	aws lambda invoke --function-name rustTest \
	--payload '{"firstName": "rust"}' \
	output.json && cat output.json && rm output.json

clean:
	rm lambda.zip &
	aws lambda delete-function \
	--function-name rustTest

zip:
	zip -j lambda.zip ./target/x86_64-unknown-linux-musl/release/bootstrap

create:
	aws lambda create-function --function-name rustTest \
	--handler doesnt.matter \
	--zip-file fileb://./lambda.zip \
	--runtime provided \
	--role arn:aws:iam::xxxxxxx:role/test-lambda \
	--environment Variables={RUST_BACKTRACE=1} \
	--tracing-config Mode=Active \


