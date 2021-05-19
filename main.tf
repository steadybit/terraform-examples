# See https://registry.terraform.io/providers/hashicorp/helm/latest/docs for detailed instructions and further configuration options.
provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

variable "agent_key" {
  type = string
  description = "The API key the agent uses."
}

variable "cluster_name" {
  type = string
  description = "Represents the name that will be assigned to this Kubernetes cluster in steadybit."
}

# See https://registry.terraform.io/providers/hashicorp/helm/latest/docs for detailed instructions and further configuration options.
resource "helm_release" "steadybit_helm_chart" {
  name  = "steadybit-agent"
  repository = "https://steadybit.github.io/helm-charts"
  chart = "steadybit-agent"
  namespace = "steadybit-agent"
  create_namespace = true
  set {
    name  = "agent.key"
    value = var.agent_key
  }
  set {
    name = "cluster.name"
    value = var.cluster_name
  }
}