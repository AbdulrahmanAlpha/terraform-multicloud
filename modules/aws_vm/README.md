# AWS VM Module

This module provisions a single **Amazon EC2 Instance**.

## Inputs

Requires `ami_id`, `instance_type`, and network identifiers (`subnet_id`, `security_group_id`).

## Outputs

Exports the `instance_id` and `public_ip` of the deployed server.