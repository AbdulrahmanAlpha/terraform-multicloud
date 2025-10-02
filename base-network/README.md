# Base Network Infrastructure

This directory provisions the foundational networking resources required by the application modules across all three clouds:

1.  **AWS:** VPC, Subnets, Internet Gateway, and a default Security Group.
2.  **Azure:** Virtual Network (VNet), Subnets, and a Network Security Group (NSG).
3.  **GCP:** VPC Network, Subnets, and Firewall Rules.

These resources are provisioned once and the resulting IDs are passed to the environment configurations (in the `envs/` directory) to ensure network consistency.