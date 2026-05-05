# Multi-Environment DevOps Platform

A hands-on DevOps portfolio project that demonstrates how modern teams deploy applications across multiple environments using Infrastructure as Code and CI/CD practices.

---

## 🚀 Project Goal

This project simulates a real-world deployment workflow across three environments:

- **Development (Dev)**  
  Safe environment for testing new features and experiments.

- **Staging**  
  Pre-production environment where changes are reviewed and validated before release.

- **Production (Prod)**  
  The live system used by real users.

The objective is to understand how code moves safely from development to production using modern DevOps workflows.

---

## 🧰 Tech Stack

- **Terraform** — Infrastructure as Code (provision cloud resources)
- **AWS EC2** — Cloud virtual machines
- **Docker** — Containerized application deployment
- **Nginx** — Reverse proxy & web server
- **GitHub Actions** — CI/CD automation pipelines
- **Linux (WSL)** — Local development environment
- **Docker Hub** — Container image registry
- **Node.js** — Sample web application


---

## 🏗️ Architecture Overview

**Developer → GitHub → GitHub Actions → Docker Hub → AWS EC2 → Nginx → Users**

High-Level Flow
Developer writes code locally
Changes are pushed to GitHub
GitHub Actions builds and pushes Docker images
The EC2 server pulls the correct image
Nginx routes traffic to the correct environment container

---


## 🌍 Enviromnets

| Environment    | Purpose                                |
| -------------- | -------------------------------------- |
| **Dev**        | Development and testing of new changes |
| **Staging**    | Pre-production validation              |
| **Production** | Live application for end users         |

---

## 🔄 CI/CD Workflow
1. Code is developed in the dev branch
2. Pull Request: dev → staging
3. Merge triggers staging deployment
4. Pull Request: staging → main
5. Merge triggers production deployment
GitHub Actions Pipeline

For each deployment, the workflow:

checks out the repository
detects the target environment from the branch
builds the Docker image
pushes the image to Docker Hub
connects to the EC2 instance via SSH
runs the deployment script for the selected environment

---

## 📁 Repository Structure


```text
multi-env-devops-platform/
├── terraform/           # Infrastructure as Code
├── app/                 # Application source code
├── deploy/              # Deployment scripts and configs
├── .github/workflows/   # CI/CD pipelines
├── .gitignore
└── README.md


```

---

## 📈 Architecture Diagram

                         ┌──────────────────────┐
                         │   Developer (Local)  │
                         └──────────┬───────────┘
                                    │
                                    │ git push / PR
                                    ▼
                         ┌──────────────────────┐
                         │       GitHub         │
                         │  Branches + PR Flow  │
                         └──────────┬───────────┘
                                    │
                                    │ triggers
                                    ▼
                         ┌──────────────────────┐
                         │   GitHub Actions     │
                         │   Build / Push /     │
                         │      Deploy          │
                         └──────────┬───────────┘
                                    │
                     push image      │      ssh deploy
                                    │
                ┌───────────────────▼───────────────────┐
                │              Docker Hub               │
                │      dev / staging / prod images      │
                └───────────────────┬───────────────────┘
                                    │
                                    │ pull image
                                    ▼
                     ┌──────────────────────────────────┐
                     │          AWS EC2 Instance        │
                     │                                  │
                     │  ┌────────────────────────────┐  │
                     │  │           Nginx            │  │
                     │  │ Reverse Proxy / Routing    │  │
                     │  └───────────┬────────────────┘  │
                     │              │                   │
                     │    ┌─────────┼─────────┐         │
                     │    ▼         ▼         ▼         │
                     │ app-dev  app-staging  app-prod  │
                     │                                  │
                     └──────────────────────────────────┘
                                    │
                                    ▼
                                  Users



---

## 🔄 Local Development Workflow

```bash
# Go to project folder
cd /home/ntenis_sampani/projects/multi-env-devops-platform

# Stage changes
git add .

# Save version
git commit -m "Describe changes"

# Upload to GitHub
git push

```
---


## 🎯 Learning Objectives

Through this project, I practice:

Writing Infrastructure as Code with Terraform

Managing cloud resources on AWS

Building and running containers with Docker

Setting up reverse proxy with Nginx

Automating deployments with CI/CD pipelines

Following real multi-environment DevOps workflows

---


## 📌 Author

Ntenis Sampani


Computer Science Grad Student


DevOps & Cloud Engineering Enthusiast

---