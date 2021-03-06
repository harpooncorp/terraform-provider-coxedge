terraform {
  required_providers {
    coxedge = {
      version = "0.1"
      source = "coxedge.com/cox/coxedge"
    }
  }
}

provider "coxedge" {
}

data "coxedge_organizations" "techops_org" {

}

resource "coxedge_network_policy_rule" "testing" {
  workload_id = "11d23a49-0abe-4acc-8f55-12577ef382c5"
  environment_name = "netbox"
  description = "terraupdate"
  protocol = "TCP"
  type = "INBOUND"
  action = "ALLOW"
  source = "0.0.0.0/0"
  port_range = "30000-33001"
}

output "policy_id" {
  value = coxedge_network_policy_rule.testing.id
}