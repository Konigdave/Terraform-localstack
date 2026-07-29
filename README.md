# Modular AWS Infrastructure with Terraform

A modular Infrastructure as Code (IaC) project that provisions AWS resources using Terraform and automates deployments through GitHub Actions. The project demonstrates best practices for reusable Terraform modules, environment separation, remote state management, and CI/CD workflows.

---

## Overview

This project was built to gain hands-on experience with Terraform beyond writing single-file configurations. The primary objective was to understand how production-style Terraform projects are organized using reusable modules, separate environments, remote state, and automated deployment pipelines.

The infrastructure is deployed to AWS using Terraform, while GitHub Actions automates validation, planning, and deployment through a branch-based workflow.

---

## Architecture

```


                    GitHub
                       │
          Feature Branch / Pull Request
                       │
                       ▼
                GitHub Actions
         Validate → Plan → Apply (Dev)
                       │
                       ▼
                  Terraform
                       │
      ┌────────────────┼────────────────┐
      ▼                ▼                ▼
     VPC         Security Groups       S3
      │
 ┌────┴────┐
 ▼         ▼
Public   Private
Subnet   Subnet
      │
      ▼
     EC2
```

## Features

```

- Modular Terraform architecture
- Reusable infrastructure modules
- Separate development and production environments
- Remote Terraform state stored in Amazon S3
- GitHub Actions CI/CD pipeline
- Branch-based deployment workflow
- Infrastructure managed entirely as code

```

## Project structure

```

terraform-modular-infra/
│
├── .github/
│   └── workflows/
│       └── terraform.yml
│
├── bootstrap/
│
├── environments/
│   ├── dev/
│   └── prod/
│
├── modules/
│   ├── ec2/
│   ├── s3/
│   ├── security_group/
│   └── vpc/
│
└── README.md

```

## Technologies Used

```

Terraform
AWS
Amazon EC2
Amazon VPC
Amazon S3
Git
GitHub
GitHub Actions

```

## CI/CD Workflow

```

feature/*
      │
      ▼
Pull Request
      │
      ▼
     dev
      │
Terraform Apply
      │
      ▼
     AWS

```

## What I Learned

```

This project helped me understand:

- Designing reusable Terraform modules
- Organizing Terraform projects for multiple environments
- Managing remote Terraform state
- Building Infrastructure as Code on AWS
- Creating CI/CD pipelines using GitHub Actions
- Applying Git workflows to infrastructure deployments
- Debugging Terraform and AWS deployment issues

```

## Future Improvements

```

Potential future enhancements include:

- Manual approval before production deployments
- Terraform formatting and security checks
- Cost estimation
- Kubernetes deployment using Amazon EKS
- Monitoring and alerting
