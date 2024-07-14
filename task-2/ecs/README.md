# this is ecs that will reference another repo

```module "ecs" {
  source = "git::https://github.com/devdot4/modules-repo.git//modules/ecs?ref=main"

  region             = " " # add region here
  cluster_name       = "my-cluster"
  task_family        = "my-task-family"
  task_cpu           = "256"
  task_memory        = "512"
  container_name     = "my-container"
  container_image    = "nginx:latest"
  container_port     = 80
  service_name       = "my-service"
  desired_count      = 2
  subnet_ids         = ["subnet-12345678", "subnet-87654321"]
  security_group_ids = ["sg-12345678"]
}
```

### TF-plan output
```Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.ecs.aws_ecs_cluster.example will be created
  + resource "aws_ecs_cluster" "example" {
      + arn      = (known after apply)
      + id       = (known after apply)
      + name     = "my-cluster"
      + tags_all = (known after apply)
    }

  # module.ecs.aws_ecs_service.example will be created
  + resource "aws_ecs_service" "example" {
      + cluster                            = (known after apply)
      + deployment_maximum_percent         = 200
      + deployment_minimum_healthy_percent = 100
      + desired_count                      = 2
      + enable_ecs_managed_tags            = false
      + enable_execute_command             = false
      + iam_role                           = (known after apply)
      + id                                 = (known after apply)
      + launch_type                        = "FARGATE"
      + name                               = "my-service"
      + platform_version                   = (known after apply)
      + scheduling_strategy                = "REPLICA"
      + tags_all                           = (known after apply)
      + task_definition                    = (known after apply)
      + triggers                           = (known after apply)
      + wait_for_steady_state              = false

      + network_configuration {
          + assign_public_ip = false
          + security_groups  = [
              + "sg-12345678",
            ]
          + subnets          = [
              + "subnet-12345678",
              + "subnet-87654321",
            ]
        }
    }

  # module.ecs.aws_ecs_task_definition.example will be created
  + resource "aws_ecs_task_definition" "example" {
      + arn                      = (known after apply)
      + arn_without_revision     = (known after apply)
      + container_definitions    = jsonencode(
            [
              + {
                  + essential    = true
                  + image        = "nginx:latest"
                  + name         = "my-container"
                  + portMappings = [
                      + {
                          + containerPort = 80
                          + hostPort      = 80
                        },
                    ]
                },
            ]
        )
      + cpu                      = "256"
      + family                   = "my-task-family"
      + id                       = (known after apply)
      + memory                   = "512"
      + network_mode             = "awsvpc"
      + requires_compatibilities = [
          + "FARGATE",
        ]
      + revision                 = (known after apply)
      + skip_destroy             = false
      + tags_all                 = (known after apply)
      + track_latest             = false
    }

Plan: 3 to add, 0 to change, 0 to destroy.

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
```