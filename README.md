[![Build Status](https://jenkins-terraform.mesosphere.com/service/dcos-terraform-jenkins/job/dcos-terraform/job/terraform-gcp-private-agents/job/master/badge/icon)](https://jenkins-terraform.mesosphere.com/service/dcos-terraform-jenkins/job/dcos-terraform/job/terraform-gcp-private-agents/job/master/)
# DC/OS Instances

Creates DC/OS Private Agent intances

## Usage

```hcl
module "pvtagts" {
  source = "dcos-terraform/instances/gcp"
  version = "~> 0.2.0"

  num_instance                   = "${var.instances_count}"
  disk_size                      = "${var.gcp_instances_disk_size}"
  disk_type                      = "${var.gcp_instances_disktype}"
  region                         = "${var.gcp_region}"
  machine_type                   = "${var.gcp_instances_gce_type}"
  cluster_name                   = "${var.cluster_name}"
  public_ssh_key                 = "${var.gcp_ssh_key}"
  instances_subnetwork_name      = "${module.network.instances_subnetwork_name}"
  instances_targetpool_self_link = "${module.network.instances_targetpool_self_link}"
  customer_image                 = "${var.image}"
  region                         = "${var.gcp_region}"
  zone_list                      = "${data.google_compute_zones.available.names}"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cluster\_name | Name of the DC/OS cluster | string | n/a | yes |
| num\_private\_agents | Specify the amount of private agents. These agents will provide your main resources | string | n/a | yes |
| private\_agent\_subnetwork\_name | Instance Subnetwork Name | string | n/a | yes |
| public\_ssh\_key | SSH Public Key | string | n/a | yes |
| ssh\_user | SSH User | string | n/a | yes |
| zone\_list | Element by zone list | list | n/a | yes |
| dcos\_instance\_os | Operating system to use. Instead of using your own AMI you could use a provided OS. | string | `"centos_7"` | no |
| disk\_size | Disk Size in GB | string | `"120"` | no |
| disk\_type | Disk Type to Leverage The GCE disk type. Can be either 'pd-ssd', 'local-ssd', or 'pd-standard'. (optional) | string | `"pd-ssd"` | no |
| guest\_accelerator\_count | Count of guest accelerator type | string | `"0"` | no |
| guest\_accelerator\_type | Type of guest accelerator | string | `"nvidia-tesla-k80"` | no |
| hostname\_format | Format the hostname inputs are index+1, region, cluster_name | string | `"%[3]s-privateagent%[1]d-%[2]s"` | no |
| image | Source image to boot from | string | `""` | no |
| labels | Add custom labels to all resources | map | `<map>` | no |
| machine\_type | Instance Type | string | `"n1-standard-2"` | no |
| name\_prefix | Name Prefix | string | `""` | no |
| scheduling\_preemptible | Deploy instance with preemptible scheduling | string | `"false"` | no |
| tags | Add custom tags to all resources | list | `<list>` | no |
| user\_data | User data to be used on these instances (cloud-init) | string | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| dcos\_instance\_os | Operating system to use. Instead of using your own AMI you could use a provided OS. |
| disk\_size | Disk Size in GB |
| disk\_type | Disk Type to Leverage The GCE disk type. Can be either 'pd-ssd', 'local-ssd', or 'pd-standard'. (optional) |
| image | Source image to boot from |
| instances\_self\_link | List of instance self links |
| machine\_type | Instance Type |
| name\_prefix | Name Prefix |
| num\_private\_agents | Specify the amount of private agents. These agents will provide your main resources |
| os\_user | The OS user to be used |
| prereq-id | Returns the ID of the prereq script (if user_data or ami are not used) |
| private\_agent\_subnetwork\_name | Instance Subnetwork Name |
| private\_ips | List of private ip addresses created by this module |
| public\_ips | List of public ip addresses created by this module |
| public\_ssh\_key | SSH Public Key |
| scheduling\_preemptible | Deploy instance with preemptible scheduling |
| user\_data | User data to be used on these instances (cloud-init) |
| zone\_list | Element by zone list |

