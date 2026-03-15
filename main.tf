# main.tf — Terraform config for your team namespace

terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.35"
    }
  }
}


provider "kubernetes" {
  config_path = "~/.kube/config"
  # Or if you use KUBECONFIG env var, Terraform picks it up automatically
}

# Create a ConfigMap in your team namespace
resource "kubernetes_config_map" "app_config" {
  metadata {
    name      = "terraform-demo"
    namespace = "FridhemFighters"

    labels = {
      "managed-by" = "terraform"
      "team"       = "FridhemFighters"
    }
  }

  data = {
    APP_ENV     = "production"
    APP_VERSION = "2.0.0"       # Changed!
    MANAGED_BY  = "terraform"
  }
}

