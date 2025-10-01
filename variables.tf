variable "compartment_id" {
  description = "The OCID of the compartment in which to create the Kubernetes cluster and its associated resources."
  type        = string
}
variable "kubernetes_version" {
  description = "The version of Kubernetes to use for the cluster."
  type        = string
}
variable "cluster_name" {
  description = "The name of the Kubernetes cluster."
  type        = string
}
variable "vcn_id" {
  description = "The OCID of the VCN in which to create the Kubernetes cluster."
  type        = string
}
variable "enable_dashboard" {
  description = "Whether to enable the Kubernetes dashboard add-on."
  type        = bool
}
variable "kubernetes_pod_cidr" {
  description = "The CIDR block to use for pod IP addresses."
  type        = string
}
variable "kubernetes_service_cidr" {
  description = "The CIDR block to use for service IP addresses."
  type        = string
}
variable "vcn_public_subnet_id" {
  description = "The OCID of the public subnet to use for the service load balancer."
  type        = string
}
variable "node_pool_name" {
  description = "Kubernetes Node Pool name"
  type        = string
}
variable "vcn_private_subnet_id" {
  description = "The OCID of the private subnet to use for the Kubernetes nodes."
  type        = string
}
variable "node_pool_size" {
  description = "Kubernetes Node Pool size"
  type        = number
  default     = 3
}
variable "node_shape" {
  description = "Kubernetes Nodes Shape"
  type        = string
  default     = "VM.Standard2.1"
}
variable "node_image_ocid" {
  description = "Kubernetes Node Image OCID"
  type        = string
}
variable "region" {
  description = "The region to deploy resources in"
  type        = string
}
variable "csi_driver_chart_version" {
  description = "CSI Driver Chat Version"
  type        = string
}
variable "csi_chart_version" {
  description = "CSI Driver Chat Version"
  type        = string
}