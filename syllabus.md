````md
# DevOps Syllabus

---

# Day 1: Introduction to Docker

## Theory Topics

- What is Docker and its role in modern application deployment
- Virtualization vs Containerization – VMs vs Containers
  - Advantages
  - Disadvantages
  - Use Cases
- Docker Architecture
  - Docker Client
  - Docker Daemon
  - Docker Registry
  - Images
  - Containers
- Docker Images vs Containers – Key Differences
- Basic Docker Commands and Their Usage

## Hands-on Lab

- Install Docker Engine on Ubuntu
- Verify Docker installation using:
  ```bash
  docker version
  docker run hello-world
````

* Pull popular images from Docker Hub:

  * nginx
  * redis
  * postgres
* Run, stop, start, and remove containers
* Explore commands:

  ```bash
  docker ps
  docker logs
  docker exec -it
  docker inspect
  ```

---

# Day 2: Docker Advanced

## Theory Topics

* Dockerfile Structure and Best Practices

  * FROM
  * WORKDIR
  * COPY
  * RUN
  * CMD
  * EXPOSE
  * ENV
* Docker Volumes – Persistent Data Storage
* Docker Networking

  * bridge
  * host
  * none
* Introduction to Docker Compose and Its Benefits

## Hands-on Lab

* Write a Dockerfile for a Node.js application
* Build a custom Docker image using:

  ```bash
  docker build
  ```
* Run the container with:

  * Port mapping
  * Environment variables
* Create `docker-compose.yml` for a multi-container app:

  * Node.js
  * MongoDB
* Start, stop, and scale services using Docker Compose

---

# Day 3: Introduction to Kubernetes

## Theory Topics

* What is Kubernetes and Why It Is Needed
* Kubernetes Architecture

  * Control Plane
  * Worker Nodes
* Key Components

  * API Server
  * etcd
  * Scheduler
  * Controller Manager
  * Kubelet
  * kube-proxy
* Overview of `kubectl` and YAML manifests

## Hands-on Lab

* Install Minikube and kubectl
* Start a local Kubernetes cluster:

  ```bash
  minikube start
  ```
* Verify cluster status:

  ```bash
  kubectl get nodes
  kubectl cluster-info
  ```
* Explore basic kubectl commands

---

# Day 4: Kubernetes Pods

## Theory Topics

* What are Pods?
* Pod Lifecycle

  * Pending
  * Running
  * Succeeded
  * Failed
  * Unknown
* YAML Syntax and Structure for Kubernetes Resources
* Single-container vs Multi-container Pods

## Hands-on Lab

* Create a Pod using imperative commands:

  ```bash
  kubectl run
  ```
* Create a Pod using declarative YAML manifest
* Apply, delete, and describe Pods
* Run a multi-container Pod and check inter-container communication

---

# Day 5: ReplicaSets & Deployments

## Theory Topics

* ReplicaSets – Purpose and Limitations
* Kubernetes Deployments – Features and Advantages
* Scaling Applications Horizontally
* Rolling Updates, Rollbacks, and Deployment Strategies

## Hands-on Lab

* Create a Deployment for a Node.js or Nginx application
* Scale the Deployment:

  * Increase replicas
  * Decrease replicas
* Perform rolling updates by changing the container image version
* Roll back to a previous revision

---

# Day 6: Kubernetes Services

## Theory Topics

* Why Services Are Needed in Kubernetes
* Service Types

  * ClusterIP
  * NodePort
  * LoadBalancer
* Kubernetes Networking Model and Service Discovery
* Selectors and Endpoints

## Hands-on Lab

* Expose a Deployment using ClusterIP Service
* Expose application using NodePort Service
* Access the application from browser/host machine
* Test load balancing across multiple Pods (metallb)

---

# Day 7: Namespaces & Labels

## Theory Topics

* Namespaces for Resource Isolation and Multi-tenancy
* Labels and Selectors – Key Concepts
* Organizing and Querying Resources Using Labels

## Hands-on Lab

* Create and switch between Namespaces
* Deploy resources in different namespaces
* Apply Labels to Pods and Deployments
* Use Label Selectors in Services and kubectl commands

---

# Day 8: Storage in Kubernetes

## Theory Topics

* Persistent Volumes (PV) and Persistent Volume Claims (PVC)
* Storage Classes and Dynamic Provisioning
* Access Modes

  * ReadWriteOnce
  * ReadOnlyMany
  * ReadWriteMany
* Data Persistence Concepts in Containers

## Hands-on Lab

* Create a Persistent Volume and PVC
* Mount PVC to a Pod/Deployment
* Verify data persistence by deleting and recreating Pods

---

# Day 9: ConfigMaps & Secrets

## Theory Topics

* ConfigMaps for Non-sensitive Configuration Data
* Secrets for Storing Sensitive Information

  * Passwords
  * Tokens
  * Certificates
* Ways to Inject Configuration

  * Environment Variables
  * Volume Mounts
* Best Practices for Configuration Management

## Hands-on Lab

* Create and use ConfigMap:

  * Literal values
  * From file
* Create and use Kubernetes Secrets
* Inject configuration into Pods using:

  * env
  * volume methods
* Update configuration and observe changes

---

# Day 10: Monitoring & Troubleshooting

## Theory Topics

* Logging in Kubernetes:

  ```bash
  kubectl logs
  ```
* Events and Important Troubleshooting Commands
* Common Pod Failure Scenarios

  * CrashLoopBackOff
  * ImagePullBackOff
  * Pending
* Debugging Tools and Techniques

## Hands-on Lab

* View Pod logs and container logs
* Use commands:

  ```bash
  kubectl describe
  kubectl exec
  kubectl port-forward
  ```
* Intentionally break Pods and troubleshoot issues
* Practice cluster-wide debugging commands

---

# Day 11: Ingress & Health Checks

## Theory Topics

* Ingress Controller and Ingress Resources
* Path-based and Host-based Routing
* Liveness, Readiness, and Startup Probes
* Health Check Implementation and Best Practices

## Hands-on Lab

* Install NGINX Ingress Controller in Minikube/k3s
* Configure Ingress resource for your application
* Test health check behavior

---

# Day 12: Mini Kubernetes Project

## Theory Topics

* End-to-End Application Deployment Architecture on Kubernetes
* Best Practices for Combining Multiple Kubernetes Objects
* Production Readiness Checklist

## Hands-on Lab

* Deploy a complete sample application:

  * Node.js + MongoDB
  * or Nginx
* Use the following together:

  * Deployment
  * Service
  * ConfigMap
  * PVC
  * Ingress
* Test the full application workflow locally

---

# Day 13: Introduction to CI/CD & GitLab

## Theory Topics

* What is CI/CD and Its Importance
* Overview of GitLab Platform and Features
* GitLab Workflow

  * Repositories
  * Branches
  * Merge Requests
* GitLab Runner Architecture and Types

## Hands-on Lab

* Create a new project on GitLab
* Push existing code to GitLab repository
* Register a GitLab Runner:

  * Docker executor preferred
* Configure basic runner settings

---

# Day 14: GitLab CI/CD Pipelines

## Theory Topics

* `.gitlab-ci.yml` File Structure
* Stages, Jobs, and Pipeline Workflow
* Variables, Artifacts, and Cache
* Rules and Conditions for Job Execution

## Hands-on Lab

* Create a basic `.gitlab-ci.yml` with multiple stages:

  * build
  * test
* Define variables and artifacts
* Trigger and monitor pipeline execution
* View pipeline logs and job outputs

---

# Day 15: GitLab CI/CD with Docker & Kubernetes

## Theory Topics

* Complete CI/CD Workflow for Containerized Applications
* Building Docker Images Inside GitLab CI
* Deploying to Kubernetes Using Pipelines
* Secure Practices for CI/CD

  * Variables
  * Secrets

## Hands-on Lab

* Write pipeline to build and push Docker image to GitLab Registry
* Deploy the application to Kubernetes cluster using kubectl in pipeline
* Create a complete CI/CD pipeline:

  * Build
  * Push
  * Deploy
* Trigger pipeline and verify automatic deployment

---

# Final Project

# NodeJS Application Deployment using Docker, Kubernetes & GitLab CI/CD

## Project Tasks

* Create NodeJS application
* Create Dockerfile
* Build Docker image
* Push image to Docker Hub
* Deploy application on Kubernetes Cluster
* Create GitLab CI/CD Pipeline
* Automate deployment using GitLab CI/CD

## Tools Covered

* Docker
* Kubernetes
* GitLab CI/CD
* Minikube
* GitHub

## Expected Outcome

Students will:

* Understand containerization
* Deploy applications on Kubernetes
* Create CI/CD pipelines
* Automate deployments
* Gain real-time DevOps project experience

```
```
