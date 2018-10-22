# Number of Instance
output "num_private_agents" {
  description = "Specify the amount of private agents. These agents will provide your main resources"
  value       = "${var.num_private_agents}"
}

# Cluster Name
output "name_prefix" {
  description = "Cluster Name"
  value       = "${var.cluster_name}"
}

# Instance Type
output "machine_type" {
  description = "Instance Type"
  value       = "${var.machine_type}"
}

# Element by zone list
output "zone_list" {
  description = "Element by zone list"
  value       = "${var.zone_list}"
}

# Source image to boot from
output "image" {
  description = "Source image to boot from"
  value       = "${var.image}"
}

# Disk Type to Leverage
output "disk_type" {
  description = "Disk Type to Leverage"
  value       = "${var.disk_type}"
}

# Disk Size in GB
output "disk_size" {
  description = "Disk Size in GB"
  value       = "${var.disk_size}"
}

# Instance Subnetwork Name
output "private_agent_subnetwork_name" {
  description = "Instance Subnetwork Name"
  value       = "${var.private_agent_subnetwork_name}"
}

# Customer Provided Userdata
output "user_data" {
  description = "User data to be used on these instances (cloud-init)"
  value       = "${var.user_data}"
}

# SSH User
output "ssh_user" {
  description = "SSH User"
  value       = "${module.dcos-pvtagt-instances.ssh_user}"
}

# SSH Public Key
output "public_ssh_key" {
  description = "SSH Public Key"
  value       = "${var.public_ssh_key}"
}

# Private IP Addresses
output "private_ips" {
  description = "List of private ip addresses created by this module"
  value       = ["${module.dcos-pvtagt-instances.private_ips}"]
}

# Public IP Addresses
output "public_ips" {
  description = "List of public ip addresses created by this module"
  value       = ["${module.dcos-pvtagt-instances.public_ips}"]
}

# Tested DCOS OSes Name
output "dcos_instance_os" {
  description = "Operating system to use. Instead of using your own AMI you could use a provided OS."
  value       = "${var.dcos_instance_os}"
}

# Preemptible Scheduling (bool)
output "scheduling_preemptible" {
  description = "Deploy instance with preemptible scheduling. (bool)"
  value       = "${var.scheduling_preemptible}"
}

# Private Node Self Link
output "instances_self_link" {
  description = "List of instance self links"
  value       = ["${module.dcos-pvtagt-instances.instances_self_link}"]
}

# Returns the ID of the prereq script (if images are not used)
output "prereq_id" {
  description = "Returns the ID of the prereq script for public agents (if image are not used)"
  value       = "${module.dcos-pvtagt-instances.prereq_id}"
}
