# MeteoGroup S3 Backend Terraform module

Creates a S3 bucket and a DynamoDB table to be used as a
[Terraform remote S3 backend](https://www.terraform.io/docs/backends/types/s3.html).


## Inputs

`product`\
Name of product / project for which to create the backend resources

`account`\
Type of AWS account in which to create the backend. Should be either `prod` or `nonprod`

`tags`\
AWS tags to add to the created backend resources.\
*Default:* none
