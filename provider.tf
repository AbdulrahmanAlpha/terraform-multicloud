# Configures the core providers used in the project.

# AWS Provider Configuration
provider "aws" {
  region = "us-east-1"
  # Authentication is typically handled via environment variables (AWS_ACCESS_KEY_ID, etc.)
}

# Azure Provider Configuration
provider "azurerm" {
  features {}
  # Authentication is typically handled via environment variables (ARM_CLIENT_ID, etc.)
}

# GCP Provider Configuration
provider "google" {
  project = "gcp-project-id-placeholder"
  region  = "us-central1"
  zone    = "us-central1-a"
  # Authentication is typically handled via variables or environment variables (GOOGLE_CREDENTIALS, etc.)
}