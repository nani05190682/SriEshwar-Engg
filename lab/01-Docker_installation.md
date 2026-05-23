# Lab Exercise: Install Docker Engine on Ubuntu

## Objective

By the end of this lab, you will be able to:

* Install Docker Engine on Ubuntu
* Start and enable the Docker service
* Run Docker commands
* Verify Docker installation using test containers

---

# Lab Environment

| Component   | Details              |
| ----------- | -------------------- |
| OS          | Ubuntu 22.04 / 24.04 |
| User Access | Sudo Privileges      |
| Internet    | Required             |

---

# Architecture Overview

```text
+----------------------+
|     Ubuntu Server    |
+----------+-----------+
           |
           v
+----------------------+
|   Docker Repository  |
+----------+-----------+
           |
           v
+----------------------+
|   Docker Engine      |
|   containerd         |
|   Docker CLI         |
+----------+-----------+
           |
           v
+----------------------+
|   Docker Containers  |
+----------------------+
```

---

# Exercise 1: Verify Ubuntu Version

## Step 1: Check OS Version

```bash
cat /etc/os-release
```

### Expected Output

```bash
Ubuntu 22.04 LTS
```

---

# Exercise 2: Remove Old Docker Versions

## Step 1: Remove Existing Docker Packages

```bash
sudo apt-get remove docker docker-engine docker.io containerd runc
```

---

# Exercise 3: Update Ubuntu Packages

## Step 1: Update Package Index

```bash
sudo apt update
```

## Step 2: Upgrade Packages

```bash
sudo apt upgrade -y
```

---

# Exercise 4: Install Required Packages

## Step 1: Install Dependencies

```bash
sudo apt install -y ca-certificates curl gnupg lsb-release
```

---

# Exercise 5: Add Docker Official GPG Key

## Step 1: Create Keyrings Directory

```bash
sudo install -m 0755 -d /etc/apt/keyrings
```

## Step 2: Download Docker GPG Key

```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```

## Step 3: Set Permissions

```bash
sudo chmod a+r /etc/apt/keyrings/docker.gpg
```

---

# Exercise 6: Add Docker Repository

## Step 1: Configure Docker Repository

```bash
echo \
  "deb [arch=$(dpkg --print-architecture) \
  signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

## Step 2: Update Package Index

```bash
sudo apt update
```

---

# Exercise 7: Install Docker Engine

## Step 1: Install Docker Packages

```bash
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

---

# Exercise 8: Verify Docker Installation

## Step 1: Check Docker Version

```bash
docker --version
```

### Expected Output

```bash
Docker version 28.x.x
```

## Step 2: Verify Docker Service Status

```bash
sudo systemctl status docker
```

### Expected Output

```bash
active (running)
```

---

# Exercise 9: Enable Docker Service

## Step 1: Enable Docker at Boot

```bash
sudo systemctl enable docker
```

## Step 2: Start Docker Service

```bash
sudo systemctl start docker
```

---

# Exercise 10: Run First Docker Container

## Step 1: Run Hello-World Container

```bash
sudo docker run hello-world
```

### Expected Output

```text
Hello from Docker!
This message shows that your installation appears to be working correctly.
```

---

# Exercise 11: Run Docker Without sudo

## Step 1: Create Docker Group

```bash
sudo groupadd docker
```

> Ignore the error if the group already exists.

## Step 2: Add Current User to Docker Group

```bash
sudo usermod -aG docker $USER
```

## Step 3: Refresh Group Membership

```bash
newgrp docker
```

## Step 4: Verify Docker Access

```bash
docker ps
```

---

# Exercise 12: Pull and Run Ubuntu Container

## Step 1: Pull Ubuntu Image

```bash
docker pull ubuntu
```

## Step 2: Run Ubuntu Container

```bash
docker run -it ubuntu bash
```

## Step 3: Verify Inside Container

```bash
cat /etc/os-release
```

## Step 4: Exit Container

```bash
exit
```

---

# Exercise 13: Docker Basic Commands

## List Running Containers

```bash
docker ps
```

## List All Containers

```bash
docker ps -a
```

## List Docker Images

```bash
docker images
```

## Stop Container

```bash
docker stop <container_id>
```

## Remove Container

```bash
docker rm <container_id>
```

## Remove Image

```bash
docker rmi ubuntu
```

---

# Exercise 14: Docker Service Troubleshooting

## Check Docker Logs

```bash
sudo journalctl -u docker
```

## Restart Docker Service

```bash
sudo systemctl restart docker
```

## Verify Docker Socket

```bash
ls -l /var/run/docker.sock
```

---

# Lab Tasks

## Task 1

Install Docker Engine successfully on Ubuntu.

## Task 2

Run the `hello-world` container.

## Task 3

Run an Ubuntu container interactively.

## Task 4

Verify Docker service is enabled.

## Task 5

Run Docker commands without `sudo`.

---

# Validation Checklist

| Validation               | Status |
| ------------------------ | ------ |
| Docker Installed         | ☐      |
| Docker Service Running   | ☐      |
| Hello-World Executed     | ☐      |
| Ubuntu Container Started | ☐      |
| Docker Without sudo      | ☐      |

---

# Interview Questions

1. What is Docker Engine?
2. Difference between Docker Engine and Docker Desktop?
3. What is containerd?
4. What is the purpose of Docker daemon?
5. Why do we add users to the Docker group?
6. Where are Docker images stored in Linux?
7. What is the difference between container and image?
8. How do you troubleshoot Docker service issues?

---

# Cleanup Steps

## Remove Containers

```bash
docker rm -f $(docker ps -aq)
```

## Remove Images

```bash
docker rmi $(docker images -q)
```

---

# Summary

In this lab, you learned how to:

* Install Docker Engine on Ubuntu
* Configure Docker repository
* Start and manage Docker service
* Run containers
* Execute Docker commands
* Troubleshoot Docker issues
