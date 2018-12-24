# lambda-rust-test

blog post: http://toidiu.com/rust/lambda/aws/understanding-lambda-in-rust/


### Instruction
Look at blog post for links to instructions on how to compile for Amazon Linux instances (target.x86_64-unknown-linux-musl).

change `--role arn:aws:iam::xxxxxxx:role/test-lambda` in makefile to run locally

```
make release
make create-function
make invoke
make clean
```



