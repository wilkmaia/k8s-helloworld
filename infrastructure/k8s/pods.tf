resource "kubernetes_replication_controller" "server" {
  metadata {
    name = "server"

    labels {
      app  = "${var.cluster_name}"
      tier = "server"
    }
  }

  spec {
    replicas = 1

    selector = {
      app  = "${var.cluster_name}"
      tier = "server"
    }

    template {
      container {
        image = "gcr.io/vii-cobepi/hello-app:v1"
        name  = "nthprime"

        port {
          container_port = 5000
        }

        resources {
          requests {
            cpu    = "100m"
            memory = "100Mi"
          }
        }
      }
    }
  }
}
