module "gke" {
  source   = "./gke"
  project  = "${var.project}"
  region   = "${var.region}"
  zone     = "${var.zone}"
  username = "${var.username}"
  password = "${var.password}"

  cluster_name = "nthprime"
}
