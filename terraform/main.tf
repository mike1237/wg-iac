terraform {
  required_providers {
    vultr = {
      source = "vultr/vultr"
      version = "2.9.1"
    }
  }
}

provider "vultr" {
  api_key = var.vultr_api_key 
  rate_limit = 700
  retry_limit = 3
}

resource "vultr_instance" "wg-server" {
    plan = "vc2-1c-1gb"
    region = "mia"
    os_id = "477"
    user_data = filebase64("cloud-config.yml")
}