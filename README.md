# OpenTofu & Terraform Hands-On Practice

A hands-on sandbox repository demonstrating **Infrastructure as Code (IaC)** fundamentals, resource lifecycle management, modular architecture, and **GitOps CI/CD automation** using OpenTofu/Terraform and GitHub Actions.

---

## 🚀 Key Topics Covered & Repository Structure

The repository is structured into isolated practice modules:

* **`.github/workflows/`** — Automated CI/CD pipeline using **GitHub Actions** for syntax validation (`tofu fmt`), plan generation (`tofu plan`), and automated deployment (`tofu apply`) on main branch commits.
* **`docker-win/`** — Local infrastructure provisioning with Docker provider integration and container lifecycle management.
* **`import-test/`** — Importing existing infrastructure into OpenTofu state (`tofu import`) and retrofitting HCL code without resource downtime.
* **`lifecycle-test/`** — Advanced resource lifecycle management (`create_before_destroy`, `prevent_destroy`, `ignore_changes`).
* **`modules/greeting/`** — Writing and consuming custom reusable IaC modules with input variables and outputs.
* **`secrets-test` (GitIgnored)** — Practicing sensitive data masking using environment variables, local files, and `.gitignore` protection.

---

## 🛠️ CI/CD & GitOps Workflow

This repository enforces automated infrastructure deployment via GitHub Actions:

1. **Format Check & Validation:** Ensures code complies with HCL standards (`tofu fmt -check` & `tofu validate`).
2. **Automated Planning:** Runs `tofu plan` on every Pull Request to preview infrastructure changes before merging.
3. **Automated Deployment:** Executes `tofu apply -auto-approve` upon merging into the `main` branch.

---

## ⚙️ How to Run Locally

### Prerequisites
* [OpenTofu](https://opentofu.org/) or [Terraform](https://www.terraform.io/)
* [Docker Desktop](https://www.docker.com/) (for Docker provider modules)

### Commands

1. **Initialize directory:**
   ```bash
   tofu init
