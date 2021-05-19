# 🚀 Terraform Examples

This repository provides an example on how to roll out the [steadybit Helm chart](https://github.com/steadybit/helm-charts/blob/master/charts/steadybit-agent/) in your Kubernetes cluster with Terraform.

## Usage

```sh
terraform init
terraform apply -var agent_key="<replace-with-agent-key>" -var cluster_name="<replace-with-cluster-name>"
```