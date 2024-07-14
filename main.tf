module "ecs" {
  source = "github.com/devdot4/modules-repo?ref=main"

  region             = "us-east-1"
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