# Source from https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/containerengine_cluster

resource "oci_containerengine_cluster" "oke-cluster" {
  # Required
  compartment_id     = var.compartment_id
  kubernetes_version = var.kubernetes_version
  name               = var.cluster_name
  vcn_id             = var.vcn_id

  # Optional
  options {
    add_ons {
      is_kubernetes_dashboard_enabled = var.enable_dashboard
      is_tiller_enabled               = false
    }
    kubernetes_network_config {
      pods_cidr     = var.kubernetes_pod_cidr
      services_cidr = var.kubernetes_service_cidr
    }
    service_lb_subnet_ids = [var.vcn_public_subnet_id]
  }
}

# Source from https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/containerengine_node_pool
resource "oci_containerengine_node_pool" "oke-node-pool" {
  # Required
  cluster_id         = oci_containerengine_cluster.oke-cluster.id
  compartment_id     = var.compartment_id
  kubernetes_version = var.kubernetes_version
  name               = var.node_pool_name
  node_config_details {
    placement_configs {
      availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
      subnet_id           = var.vcn_private_subnet_id
    }

    size = var.node_pool_size
  }
  node_shape = var.node_shape

  # Using image Oracle-Linux-7.x-<date>
  # Find image OCID for your region from https://docs.oracle.com/iaas/images/
  node_source_details {
    image_id    = var.node_image_ocid
    source_type = "image"
  }

  # Optional
  initial_node_labels {
    key   = "name"
    value = var.cluster_name
  }
}