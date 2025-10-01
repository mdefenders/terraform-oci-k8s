data "oci_containerengine_cluster_kube_config" "kubeconfig" { cluster_id = oci_containerengine_cluster.oke-cluster.id }

data "external" "oke_token" {
  program = [
    "bash", "-c",
    "oci ce cluster generate-token --cluster-id ${oci_containerengine_cluster.oke-cluster.id} --region ${var.region} | jq -c '{token: .status.token}'"
  ]
}

data "oci_identity_availability_domains" "ads" {
  compartment_id = var.compartment_id
}
