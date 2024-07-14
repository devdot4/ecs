module "ec2_instance" {
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