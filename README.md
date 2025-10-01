# Terraform OCI Kubernetes (OKE) Module

## Overview
This Terraform module provisions an Oracle Cloud Infrastructure (OCI) Kubernetes Engine (OKE) cluster, node pool, and deploys essential Helm releases for add-ons such as ingress-nginx and secrets-store-csi-driver. It is designed to simplify the setup and management of a production-ready Kubernetes environment on OCI.

## Features
- Creates an OCI Kubernetes (OKE) cluster and node pool
- Configurable Kubernetes version, node shape, and size
- Deploys Helm charts for ingress-nginx and secrets-store-csi-driver
- Outputs cluster and node pool details, kubeconfig, and API token

## Requirements
- Terraform >= 1.0
- Oracle Cloud Infrastructure (OCI) account
- OCI Terraform provider
- Helm provider for Terraform

## Usage
```hcl
module "oke" {
  source = "<module-path-or-registry>"

  compartment_id            = var.compartment_id
  kubernetes_version        = var.kubernetes_version
  cluster_name              = var.cluster_name
  vcn_id                    = var.vcn_id
  enable_dashboard          = var.enable_dashboard
  kubernetes_pod_cidr       = var.kubernetes_pod_cidr
  kubernetes_service_cidr   = var.kubernetes_service_cidr
  vcn_public_subnet_id      = var.vcn_public_subnet_id
  node_pool_name            = var.node_pool_name
  vcn_private_subnet_id     = var.vcn_private_subnet_id
  node_pool_size            = var.node_pool_size
  node_shape                = var.node_shape
  node_image_ocid           = var.node_image_ocid
  csi_driver_chart_version  = var.csi_driver_chart_version
  csi_chart_version         = var.csi_chart_version
}
```

## Inputs
| Name                      | Description                                                        | Type   | Default             |
|---------------------------|--------------------------------------------------------------------|--------|---------------------|
| compartment_id            | The OCID of the compartment for the cluster                        | string | n/a                 |
| kubernetes_version        | Kubernetes version for the cluster                                 | string | n/a                 |
| cluster_name              | Name of the Kubernetes cluster                                     | string | n/a                 |
| vcn_id                    | OCID of the VCN for the cluster                                   | string | n/a                 |
| enable_dashboard          | Enable Kubernetes dashboard add-on                                 | bool   | n/a                 |
| kubernetes_pod_cidr       | CIDR block for pod IP addresses                                    | string | n/a                 |
| kubernetes_service_cidr   | CIDR block for service IP addresses                                | string | n/a                 |
| vcn_public_subnet_id      | OCID of the public subnet for service LB                           | string | n/a                 |
| node_pool_name            | Name of the Kubernetes node pool                                   | string | n/a                 |
| vcn_private_subnet_id     | OCID of the private subnet for nodes                               | string | n/a                 |
| node_pool_size            | Size of the node pool                                              | number | 3                   |
| node_shape                | Shape of the Kubernetes nodes                                      | string | "VM.Standard2.1"    |
| node_image_ocid           | OCID of the node image                                             | string | n/a                 |
| csi_driver_chart_version  | Version of the OCI secrets store CSI driver Helm chart             | string | n/a                 |
| csi_chart_version         | Version of the secrets store CSI driver Helm chart                 | string | n/a                 |

## Outputs
| Name                     | Description                                      |
|--------------------------|--------------------------------------------------|
| cluster-name              | Name of the OKE cluster                          |
| cluster-OCID              | OCID of the OKE cluster                          |
| cluster-kubernetes-version| Kubernetes version of the cluster                |
| cluster-state             | State of the OKE cluster                         |
| node-pool-name            | Name of the node pool                            |
| node-pool-OCID            | OCID of the node pool                            |
| node-pool-kubernetes-version| Kubernetes version of the node pool            |
| node-size                 | Size of the node pool                            |
| node-shape                | Shape of the node pool nodes                     |
| host                      | Kubernetes API server endpoint                   |
| token                     | Kubernetes API token (sensitive)                 |
| cluster_ca_certificate    | Cluster CA certificate                           |
| oke_token                 | Kubernetes API token for OKE (sensitive)         |

## License
This project is licensed under the MIT License. See [LICENSE.md](LICENSE.md) for details.

