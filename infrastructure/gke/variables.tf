variable "username" {
  default = "admin"
}

variable "project" {}

variable "region" {}

variable "zone" {}

variable "cluster_name" {}

variable "password" {}

variable "min_node_count" {
  default = "1"
}

variable "max_node_count" {
  default = "3"
}

variable "machine_type" {
  default = "n1-highcpu-4"
}
