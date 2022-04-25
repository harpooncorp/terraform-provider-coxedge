terraform {
  required_providers {
    coxedge = {
      version = "0.1"
      source = "coxedge.com/cox/coxedge"
    }
  }
}

provider "coxedge" {
  key = "[INSERT API KEY HERE]"
}

data "coxedge_environments" "test" {

}

output "envs" {
  value = data.coxedge_environments.test
}

# VM Workloads
resource "coxedge_workload" "test" {
  name = "test2"
  environment_name = data.coxedge_environments.test.environments[0].name
  type = "VM"
  image = "stackpath-edge/ubuntu-1804-bionic:v202104291427"
  first_boot_ssh_key = "[INSERT API KEY HERE]"
  specs = "SP-1"
  deployment {
    name = "testvm"
    enable_autoscaling = false
    pops = ["PVD"]
    instances_per_pop = 1
  }
}
