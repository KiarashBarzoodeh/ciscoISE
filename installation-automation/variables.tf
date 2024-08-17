variable "vsphere_user" {
  type    = string
  default = "vcenter admin" #vCenter Username
}

variable "vsphere_password" {
  type    = string
  default = "*******" #vCenter Password
}

variable "vsphere_server" {
  type    = string
  default = "vcenter.nssnot.com" #vCenter address
}

variable "datacenter_name" {
  type    = string
  default = "LAB" # Datacenter Name
}

variable "datastore_name" {
  type    = string
  default = "DS1" # Datasotre name in vCenter
}

variable "cluster_name" {
  type    = string
  default = "Cluster-production" # Not mandatory
}

variable "host_address" {
  type    = string
  default = "esxi address" # It can be hostname or IP address
}

variable "portgroup_name" {
  type    = string
  default = "VLAN10" # It can be a Distributed Switch or Standard Sitch
}

variable "deployment_size" {
  type    = string
  default = "medium" # Valid deployment optionks -> Eval, PSN_Lite, small, medium, large.
}

variable "cdrom_path" {
  type    = string
  default = "ISO/pan01-ztp.img"
}

variable "ise_node_name" {
  type    = string
  default = "pan01"
}

variable "local_ovf_path" {
  type    = string
  default = "/Users/ISE-3.2.0.542a-virtual-SNS3615-SNS3655-300.ova"
}

variable "disk_provisioning" {
  type    = string
  default = "thin" # Valid options: thin, thick, flat
}
