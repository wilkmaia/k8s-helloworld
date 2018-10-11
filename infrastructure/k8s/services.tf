resource "kubernetes_service" "server" {
  metadata {
    name = "server"

    labels {
      app  = "${var.cluster_name}"
      tier = "server"
    }
  }

  spec {
    selector {
      app  = "${var.cluster_name}"
      tier = "server"
    }

    type = "LoadBalancer"

    port {
      port        = 80
      target_port = 5000
    }
  }
}
