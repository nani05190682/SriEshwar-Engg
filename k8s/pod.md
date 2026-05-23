# Kubernetes Lab Exercise

# Lab Title

Kubernetes Pods – Creating and Managing Pods

---

# Objective

In this lab, you will learn how to:

* Create Pods in Kubernetes
* Run Pods using kubectl
* Verify Pod status
* Access Pod details
* Execute commands inside Pods
* View Pod logs
* Delete Pods
* Troubleshoot Pod issues

---

# Lab Prerequisites

* Kubernetes Cluster
* kubectl configured
* Access to a worker node/control plane
* Internet connectivity

---

# Exercise 1: Verify Kubernetes Cluster

## Task

Verify cluster connectivity and node status.

### Lab Questions

1. Verify whether the Kubernetes cluster is accessible.
2. Display all worker and control plane nodes.
3. Verify node status.
4. Identify Kubernetes server version.

---

# Exercise 2: Create a Pod Using Imperative Command

## Task

Create an NGINX Pod using kubectl command.

### Lab Questions

1. Create a Pod named `nginx-pod` using the NGINX image.
2. Verify whether the Pod is created successfully.
3. Display the current status of the Pod.
4. Identify the node on which the Pod is running.
5. Identify the Pod IP address.

---

# Exercise 3: Display Pod Information

## Task

View Pod details and metadata.

### Lab Questions

1. Display all running Pods.
2. Display Pods with wide output.
3. Display detailed information about `nginx-pod`.
4. Identify the container image used by the Pod.
5. Verify container state and restart count.

---

# Exercise 4: Create Multiple Pods

## Task

Create multiple Pods using kubectl commands.

### Lab Questions

1. Create a Pod named `redis-pod` using the Redis image.
2. Create a Pod named `httpd-pod` using the Apache HTTPD image.
3. Verify all running Pods.
4. Identify container images used by all Pods.

---

# Exercise 5: Generate YAML from Running Pod

## Task

Generate Pod YAML configuration.

### Lab Questions

1. Generate YAML configuration for `nginx-pod`.
2. Export the YAML without creating a new Pod.
3. Save the Pod YAML to a file named `nginx-pod.yaml`.
4. Verify Pod configuration details inside the YAML file.

---

# Exercise 6: Create Pod Using YAML

## Task

Deploy a Pod using YAML configuration.

### Lab Questions

1. Create a Pod named `ubuntu-pod` using a YAML file.
2. Verify Pod creation status.
3. Display Pod events.
4. Identify the container image used.

---

# Exercise 7: Execute Commands Inside Pod

## Task

Access Pod containers interactively.

### Lab Questions

1. Execute a shell inside the `nginx-pod`.
2. Verify hostname inside the Pod.
3. Display operating system information inside the Pod.
4. Verify running processes inside the container.
5. Exit from the Pod shell.

---

# Exercise 8: View Pod Logs

## Task

Monitor and verify Pod logs.

### Lab Questions

1. Display logs for `nginx-pod`.
2. Display logs for `redis-pod`.
3. Stream logs in real time.
4. Display the last 20 log lines.
5. Verify whether the application started successfully.

---

# Exercise 9: Pod Labels and Selectors

## Task

Manage Pod labels.

### Lab Questions

1. Add a label to `nginx-pod`.
2. Verify Pod labels.
3. Display Pods using label selectors.
4. Add an environment label to `redis-pod`.
5. Verify label filtering.

---

# Exercise 10: Pod Troubleshooting

## Task

Troubleshoot Pod-related issues.

### Lab Questions

1. Display Pod events.
2. Identify Pod restart count.
3. Verify Pod container status.
4. Identify image pull errors.
5. Describe a failed Pod.

---

# Exercise 11: Delete Pods

## Task

Delete Pods from the cluster.

### Lab Questions

1. Delete the `nginx-pod`.
2. Delete the `redis-pod`.
3. Delete the `httpd-pod`.
4. Verify whether Pods are deleted successfully.
5. Delete Pods using label selectors.

---

# Exercise 12: Multi-Container Pod

## Task

Create and verify a multi-container Pod.

### Lab Questions

1. Create a Pod with two containers.
2. Verify both containers are running.
3. Display container names inside the Pod.
4. Access a specific container inside the Pod.
5. Verify logs for individual containers.

---

# Exercise 13: Pod Resource Information

## Task

Verify Pod resource usage.

### Lab Questions

1. Display CPU and memory utilization for Pods.
2. Identify the Pod consuming maximum memory.
3. Verify Pod resource limits.
4. Display Pod QoS class.

---

# Exercise 14: Pod Networking

## Task

Verify Pod networking details.

### Lab Questions

1. Display Pod IP addresses.
2. Verify Pod-to-Pod communication.
3. Ping one Pod from another Pod.
4. Identify DNS configuration inside the Pod.
5. Verify network namespace details.

---

# Exercise 15: Cleanup Activity

## Task

Remove all created Pods.

### Lab Questions

1. Delete all Pods in the namespace.
2. Verify namespace cleanup.
3. Remove YAML configuration files created during the lab.

---

# Challenge Exercise

## Scenario

Deploy and manage the following Pods:

* nginx-pod
* redis-pod
* ubuntu-pod
* httpd-pod

### Challenge Tasks

1. Create all Pods.
2. Verify Pod status.
3. Access each Pod interactively.
4. Verify logs for each Pod.
5. Add labels to Pods.
6. Display Pods using selectors.
7. Delete all Pods after verification.

---

