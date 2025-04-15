resource_group_name  = "cst8918-final-project"
location             = "Canada Central"
storage_account_name = "cst8918storagegroupfp10"
container_name       = "tfstate"
vnet_name            = "final-project-vnet"
acr_name = "cst8918acrgroupfp10"
subnets = {
  prod  = "10.0.0.0/16"
  test  = "10.1.0.0/16"
  dev   = "10.2.0.0/16"
  admin = "10.3.0.0/16"
}

