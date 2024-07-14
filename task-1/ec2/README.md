# this is ecs that will reference another repo
```module "ec2_instance" {
  source = "git::https://github.com/devdot4/modules-repo.git//modules/ec2?ref=main"

  region          = " " # add region here
  ami_id          = "ami-12345678"
  instance_type   = "t2.micro"
  subnet_id       = "subnet-12345678"
  key_name        = "my-keypair"
  security_groups = ["sg-12345678"]
  instance_name   = "my-instance"
  instance_port   = 80
}
```

### TF-plan output
```Terraform will perform the following actions:

  # module.ec2_instance.aws_instance.example will be created
  + resource "aws_instance" "example" {
      + ami                                  = "ami-12345678"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t2.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = "my-keypair"
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = [
          + "sg-12345678",
        ]
      + source_dest_check                    = true
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = "subnet-12345678"
      + tags                                 = {
          + "Name" = "my-instance"
        }
      + tags_all                             = {
          + "Name" = "my-instance"
        }
      + tenancy                              = (known after apply)
      + user_data                            = "ea756a7acb1e3f388e55181340ed20838a1bbe26"
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
```