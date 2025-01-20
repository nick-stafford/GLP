# GLP

[![Python](https://img.shields.io/badge/Python-3.11+-3776AB?style=flat&logo=python&logoColor=white)](https://python.org)
[![Docker](https://img.shields.io/badge/Docker-Ready-2496ED?style=flat&logo=docker&logoColor=white)](https://docker.com)
[![Kubernetes](https://img.shields.io/badge/Kubernetes-EKS-326CE5?style=flat&logo=kubernetes&logoColor=white)](https://kubernetes.io)

**CI/CD Pipeline Orchestrator — End-to-end deployment automation from code to production.**

GLP provides a streamlined CLI for managing multi-environment deployments with built-in testing, containerization, and Kubernetes orchestration.

---

## Features

- **Multi-Environment Deploys** — Dev, Staging, Production with single command
- **Pipeline Stages** — Build → Test → Containerize → Deploy
- **Docker Integration** — Automated image building and registry push
- **Kubernetes Native** — Rolling updates with health checks
- **Rollback Support** — Instant rollback to any previous version
- **Dry Run Mode** — Preview deployments before execution

---

## Quick Start

```bash
# Install
pip install -r requirements.txt

# Deploy to dev
python app.py deploy --env dev

# Deploy to production (with tests)
python app.py deploy --env production

# Skip tests for hotfix
python app.py deploy --env production --skip-tests

# Preview without executing
python app.py deploy --env staging --dry-run
```

---

## Commands

| Command | Description |
|---------|-------------|
| `deploy --env <env>` | Deploy to specified environment |
| `status` | Check health of all environments |
| `rollback <version>` | Rollback to previous version |

### Deploy Options

```bash
--env         # Target: dev, staging, production
--skip-tests  # Skip test stage
--dry-run     # Preview only
```

---

## Pipeline Stages

```
┌─────────────┐    ┌─────────────┐    ┌─────────────┐    ┌─────────────┐
│    BUILD    │ →  │    TEST     │ →  │ CONTAINERIZE│ →  │   DEPLOY    │
└─────────────┘    └─────────────┘    └─────────────┘    └─────────────┘
  Dependencies       Unit tests        Docker build       K8s rollout
  TypeScript         Integration       Push to GCR        Health check
  React/FastAPI      Coverage 94%+     Tag version        3/3 pods ready
```

---

## Project Structure

```
GLP/
├── app.py              # CLI entry point
├── Dockerfile          # Container definition
├── requirements.txt
├── pipelines/          # Pipeline configurations
│   ├── build.yaml
│   ├── test.yaml
│   └── deploy.yaml
├── k8s/                # Kubernetes manifests
│   ├── deployment.yaml
│   ├── service.yaml
│   └── ingress.yaml
└── src/
    └── stages/         # Stage implementations
```

---

## Example Output

```
🚀 GLP Pipeline v2.4.1 - Starting deployment to production...
══════════════════════════════════════════════════════════

  STAGE: BUILD
  ──────────────────────────────────────────────
  → Installing dependencies...
  → Compiling TypeScript...
  → Building React frontend...
  → Building FastAPI backend...
  ✓ BUILD completed

  STAGE: TEST
  ──────────────────────────────────────────────
  → Running unit tests... 147 passed
  → Running integration tests... 38 passed
  → Code coverage: 94.2%
  ✓ TEST completed

  STAGE: CONTAINERIZE
  ──────────────────────────────────────────────
  → Building Docker image...
  → Pushing to registry: gcr.io/glp-prod/app:v2.4.1
  ✓ CONTAINERIZE completed

  STAGE: DEPLOY
  ──────────────────────────────────────────────
  → Connecting to AWS EKS cluster (production)...
  → Applying Kubernetes manifests...
  → Rolling update: 0/3 → 1/3 → 2/3 → 3/3 pods ready
  ✓ DEPLOY completed

══════════════════════════════════════════════════════════
🎉 DEPLOYMENT COMPLETE
   Environment: production
   Duration: 45.2s
   URL: https://app.glp-production.io
══════════════════════════════════════════════════════════
```

---

## License

MIT License

---

<p align="center">
  Built by <a href="https://nickstafford.dev">Nick Stafford</a>
</p>
