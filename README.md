# Terraform Examples

Welcome to the **Terraform Examples** repository! This repository contains various Terraform configurations to help you deploy infrastructure as code on AWS.

## Prerequisites

Before you can use these examples, ensure you have the following installed:

- [AWS CLI](https://aws.amazon.com/cli/) (configured with your AWS credentials)
- [Terraform](https://www.terraform.io/downloads.html)

## Setup & Execution

Follow these steps to execute the Terraform configurations:

1. **Configure AWS CLI**
   ```sh
   aws configure
   ```
   Provide your AWS Access Key, Secret Key, Region, and output format as prompted.

2. **Navigate to the desired example folder**
   ```sh
   cd <example-folder>
   ```

3. **Initialize Terraform in the selected folder**
   ```sh
   terraform init
   ```

4. **Apply Terraform Configuration**
   ```sh
   terraform apply
   ```
   Confirm the execution when prompted.

## Cleanup

To destroy the infrastructure created by Terraform in a specific example folder:

```sh
cd <example-folder>
terraform destroy
```

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
