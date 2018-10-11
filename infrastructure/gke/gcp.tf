provider "google" {
  credentials = "${file("~/.googlecloud/credentials.json")}"
  project     = "${var.project}"
  region      = "${var.region}"
}
