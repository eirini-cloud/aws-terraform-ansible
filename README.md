# aws-terraform-ansible
12 Week Technical Depth Programme Labs
# AWS Terraform & Ansible – Technical Depth Programme

This repository contains infrastructure and configuration automation built as part of a 12-Week Technical Depth Programme focused on production-style engineering practices.

The goal is to model *real-world workflows* used by infrastructure and platform teams.

----

## What’s in this repository

### Terraform
- AWS infrastructure provisioning
- Environment: eu-north-1
- Managed resources include:
  - VPC and networking
  - EC2 instances
  - Security groups
- Designed to be executed via CI/CD (GitHub Actions)

### Ansible
- Role-based configuration management
- Idempotent playbooks
- Handlers and templates used appropriately
- Static inventory (intentional at this stage)
- `ansible-lint` passing with zero failures

----

## CI/CD Workflow

This repository uses **GitHub Actions** to enforce safe and repeatable changes.

### Pull Requests
- Terraform formatting, validation, and plan
- Ansible linting
- No infrastructure changes applied

### Main Branch
- Terraform apply gated by manual approval
- Ansible playbooks run against provisioned EC2 instances

This models a **production change-control workflow**.

---

## Security

- No secrets are committed to this repository
- AWS authentication is handled via GitHub Secrets (OIDC or short-lived credentials)
- SSH access keys are injected at runtime by CI only

---

## Programme Context

This repository evolves over time as part of a structured learning path:

- Weeks 1 - 6: Linux, Networking, Infrastructure, Configuration Management
- Week 7: CI/CD & change control
- Weeks 8 -12: Containers, Kubernetes, Security, Operations, Architecture trade-offs

Design decisions are **intentional and incremental**.

---

## ⚠️ Notes

This repository prioritises:
- Clarity 
- Safety
- Understanding vs abstraction
