region                     = "us-east-1"
instance_type              = "t2.small"
enable_detailed_monitoring = true

private_key  =  "~/.ssh/aws_adhoc.pem"
public_key   =  "~/.ssh/aws_adhoc.pub"

common_tags = {
  Owner       = "Alex Tchaikovski"
  Project     = "Skill factory P9 project"
  Purpose     = ""
}

database_host_name = "database"
docker_host_name = "docker"
docker_count = 1
database_count = 1

az           = "us-east-1a"