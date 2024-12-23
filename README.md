# Terraform S3 Backend

This repository contains a simple Terraform configuration for setting up an S3 backend to store Terraform state files. It includes configurations for deploying resources to AWS and GitHub Actions workflows for automating the deployment process.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) >= 1.10
- AWS account with appropriate permissions
- GitHub repository secrets for AWS credentials and S3 backend configuration

## Repository Structure

- `terraform/`: Contains the Terraform configuration files.
  - `versions.tf`: Specifies the required Terraform version and providers.
  - `variables.tf`: Defines the input variables for the Terraform configuration.
  - `configurations/s3-backend-deploy.tfvars`: Contains the variable values for deploying the S3 backend.
- `.github/workflows/`: Contains GitHub Actions workflows for CI/CD.
  - `s3-backend-deploy.yml`: Workflow for deploying the Terraform configuration.
  - `s3-backend-build.yml`: Workflow for validating and planning the Terraform configuration on pull requests.

## Setup

1. Clone the repository:

    ```sh
    git clone https://github.com/your-username/simple-terraform-s3-backend.git
    cd simple-terraform-s3-backend
    ```

2. Configure AWS credentials as GitHub repository secrets:
   - `AWS_ACCESS_KEY_ID`
   - `AWS_SECRET_ACCESS_KEY`
   - `AWS_REGION`
   - `TF_STATE_BUCKET_NAME`
   - `TF_STATE_KEY`

3. Update the `terraform/configurations/s3-backend-deploy.tfvars` file with your desired values.

## Usage

### Deploying the S3 Backend

1. Push changes to the `main` branch or manually trigger the workflow from the GitHub Actions tab.

### Destroying the S3 Backend

1. Manually trigger the `destroy` job from the GitHub Actions tab and select the `destroy` action.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
