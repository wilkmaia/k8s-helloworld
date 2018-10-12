resource "google_container_cluster" "nthprime" {
  name = "${var.cluster_name}"
  zone = "${var.zone}"

  addons_config {
    network_policy_config {
      disabled = true
    }
  }

  master_auth {
    username = "${var.username}"
    password = "${var.password}"
  }

  node_pool {
    name = "default-pool"
  }

  local-exec {
    command = "./helm/add_helm.sh"
  }
}

resource "google_container_node_pool" "nthprime" {
  name    = "nthprime"
  cluster = "${google_container_cluster.nthprime.name}"
  zone    = "${var.zone}"

  node_config {
    machine_type = "${var.machine_type}"
  }

  autoscaling {
    min_node_count = 1
    max_node_count = 3
  }
}

resource "google_compute_autoscaler" "nthprime" {
  name   = "nthprime-autoscaler"
  zone   = "${var.zone}"
  target = "${google_container_cluster.nthprime.instance_group_urls.0}"

  autoscaling_policy = {
    max_replicas    = 3
    min_replicas    = 1
    cooldown_period = 60

    cpu_utilization {
      target = 0.6
    }
  }
}
