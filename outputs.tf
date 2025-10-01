# Outputs for k8s cluster
output "cluster-name" {
  value = oci_containerengine_cluster.oke-cluster.name
}
output "cluster-OCID" {
  value = oci_containerengine_cluster.oke-cluster.id
}
output "cluster-kubernetes-version" {
  value = oci_containerengine_cluster.oke-cluster.kubernetes_version
}
output "cluster-state" {
  value = oci_containerengine_cluster.oke-cluster.state
}

# Outputs for k8s node pool

output "node-pool-name" {
  value = oci_containerengine_node_pool.oke-node-pool.name
}
output "node-pool-OCID" {
  value = oci_containerengine_node_pool.oke-node-pool.id
}
output "node-pool-kubernetes-version" {
  value = oci_containerengine_node_pool.oke-node-pool.kubernetes_version
}
output "node-size" {
  value = oci_containerengine_node_pool.oke-node-pool.node_config_details[0].size
}
output "node-shape" {
  value = oci_containerengine_node_pool.oke-node-pool.node_shape
}

output "host" {
  value = yamldecode(data.oci_containerengine_cluster_kube_config.kubeconfig.content)["clusters"][0]["cluster"]["server"]
}

output "token" {
  description = "Kubernetes API token for OKE cluster, safe for use in helm provider."
  value       = data.external.oke_token.result["token"]
  sensitive   = true
}

output "cluster_ca_certificate" {
  value = base64decode(yamldecode(data.oci_containerengine_cluster_kube_config.kubeconfig.content)["clusters"][0]["cluster"]["certificate-authority-data"])
}

output "oke_token" {
  value     = data.external.oke_token.result["token"]
  sensitive = true
  description = "Kubernetes API token for OKE cluster, safe for use in helm provider."
}

output "kubeconfig_content" {
  value = data.oci_containerengine_cluster_kube_config.kubeconfig.content
  sensitive = true
}
