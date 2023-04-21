provider "vsphere" {
  user                 = var.vsphere_user
  password             = var.vsphere_password
  vsphere_server       = var.vsphere_server
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "datacenter" {
  name = var.datacenter_name
}

data "vsphere_datastore" "datastore" {
  name          = var.datastore_name
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

# data "vsphere_compute_cluster" "cluster" {
#   name          = var.cluster_name
#   datacenter_id = data.vsphere_datacenter.datacenter.id
# }

data "vsphere_host" "host" {
  name          = var.host_address
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "network" {
  name          = var.portgroup_name
  datacenter_id = data.vsphere_datacenter.datacenter.id
}


resource "vsphere_virtual_machine" "cisco_ise" {
  name             = var.ise_node_name
  datacenter_id    = data.vsphere_datacenter.datacenter.id
  resource_pool_id = data.vsphere_host.host.resource_pool_id
  host_system_id   = data.vsphere_host.host.id
  datastore_id     = data.vsphere_datastore.datastore.id
  cdrom {
    datastore_id = data.vsphere_datastore.datastore.id
    path         = var.cdrom_path
  }

  wait_for_guest_net_routable = false
  wait_for_guest_net_timeout  = 0

  ovf_deploy {
    allow_unverified_ssl_cert = true
    local_ovf_path            = var.local_ovf_path
    disk_provisioning         = var.disk_provisioning
    deployment_option         = var.deployment_size
    ovf_network_map = {
      "VM Network" : data.vsphere_network.network.id
    }
  }

}
