module "gke" {
  source   = "./gke"
  project  = "${var.project}"
  region   = "${var.region}"
  zone     = "${var.zone}"
  username = "${var.username}"
  password = "${var.password}"

  cluster_name = "nthprime"
}

module "k8s" {
  source   = "./k8s"
  host     = "${module.gke.host}"
  username = "${var.username}"
  password = "${var.password}"

  cluster_name = "nthprime"

  client_certificate     = "${module.gke.client_certificate}"
  client_key             = "${module.gke.client_key}"
  cluster_ca_certificate = "${module.gke.cluster_ca_certificate}"
}
