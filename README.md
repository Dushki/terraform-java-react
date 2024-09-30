# terraform-java-react
This repository contains Infrastructure as Code (IaC) to deploy a fully functional Azure Kubernetes Service (AKS) cluster using Terraform. The AKS cluster is built with:

Role-Based Access Control (RBAC) enabled for secure access management.
Azure Active Directory (AAD) integration for identity management.
Azure Monitor and Log Analytics Workspace (LAW) for centralized logging and monitoring (optional).

## Architecture
The high-level architecture of the AKS cluster includes:

An Azure Resource Group to contain the AKS and its dependencies.
An Azure Kubernetes Service (AKS) cluster 
Azure Virtual Network (VNet) and subnets for AKS, with private IP allocations.
Integration with Azure Active Directory (AAD) for user authentication and RBAC.
(Optional) Azure Log Analytics Workspace (LAW) for monitoring and auditing.

## Modules and Temaplates

I have created the modules for acr,aks and network which we can refer in terraform apply. This is done as a best practise to use terraform code.

Templates are also created and parameterized in order to be used in the pipeline. Thios makes the code more generic.

I have used blob storage as a backend and configured the same in backend.tf.