resource "helm_release" "ingress_nginx" {
  name             = "ingress-nginx"
  namespace        = "ingress-nginx"
  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  create_namespace = true
  set = [
    {
      name  = "controller.scope.enabled"
      value = "false"
    },
    {
      name  = "controller.service.externalTrafficPolicy"
      value = "Local"
    }
  ]
  depends_on = [oci_containerengine_cluster.oke-cluster]
  atomic           = true
  timeout          = 600
}

resource "helm_release" "secrets_store_csi_driver" {
  name             = "secrets-store-csi-driver"
  namespace        = "kube-system"
  repository       = "https://oracle.github.io/oci-secrets-store-csi-driver-provider/charts"
  chart            = "oci-secrets-store-csi-driver-provider"
  version          = var.csi_driver_chart_version
  depends_on       = [oci_containerengine_cluster.oke-cluster]
  atomic           = true
  timeout          = 600
  set = [
    {
      name  = "secrets-store-csi-driver.install"
      value = "false"
    }
  ]
}

resource "helm_release" "secrets_store_csi" {
  name             = "secrets-store-csi"
  namespace        = "kube-system"
  repository       = "https://kubernetes-sigs.github.io/secrets-store-csi-driver/charts"
  chart            = "secrets-store-csi-driver"
  version          = var.csi_chart_version
  depends_on       = [oci_containerengine_cluster.oke-cluster]
  atomic           = true
  timeout          = 600
}

