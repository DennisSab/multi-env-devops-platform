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

---

## 🏗️ Architecture Overview

Developer writes code locally →  
Pushes to GitHub →  
CI/CD pipeline builds & deploys →  
Terraform provisions AWS infrastructure →  
Application runs in isolated environments (Dev / Staging / Prod)

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



🎯 Learning Objectives

Through this project, I practice:

Writing Infrastructure as Code with Terraform

Managing cloud resources on AWS

Building and running containers with Docker

Setting up reverse proxy with Nginx

Automating deployments with CI/CD pipelines

Following real multi-environment DevOps workflows


📌 Author

Ntenis Sampani


Computer Science Student


DevOps & Cloud Engineering Enthusiast