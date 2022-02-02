# ------------------- EC2 resources ---------------------------------

resource "aws_instance" "database" {
  ami                         = "ami-0e472ba40eb589f49" # ubuntu
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.sg.id]
  key_name                    = "aws_adhoc"
  count                       = var.database_count
  associate_public_ip_address = true
  availability_zone           = var.az

  tags = { 
    Name = "database Server # ${count.index}"
  }

}

resource "aws_instance" "docker" {
  ami                         = "ami-0e472ba40eb589f49" # ubuntu
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.sg.id]
  key_name                    = "aws_adhoc"
  count                       = var.docker_count
  associate_public_ip_address = true
  availability_zone           = var.az

  tags = {
    Name = "Docker Server # ${count.index}"
 }
}

# --------------- write inventory file ---------------------

 resource "local_file" "inventory" {
	  content = templatefile("${path.module}/hosts.tpl", {
		list_database = slice(aws_instance.database.*.public_ip, 0, var.database_count),
		list_docker = slice(aws_instance.docker.*.public_ip, 0, var.docker_count)
	  })
	  filename = "inventory"
	}

# --------- launch Ansible to deploy k8s on these resources ---------

resource "null_resource" "null1" {
  depends_on = [
     local_file.inventory
  ]

  provisioner "local-exec" {
    command = "sleep 60"
  }

  provisioner "local-exec" {
     command = "ansible-playbook -i ./inventory --private-key ${var.private_key} -e 'pub_key=${var.public_key}' playbook.yml"
  }

}

# --------------- get static IP addresses ------------------

resource "aws_eip" "database_static_ip" {
  instance = aws_instance.database[0].id
  vpc = true
  tags = { 
    Name = "database Server IP" 
  }
}

resource "aws_eip" "docker_static_ip" {
  count = var.docker_count
  instance = "${element(aws_instance.docker.*.id,count.index)}"
  vpc = true
  tags = { 
    Name = "docker${count.index} Server IP" 
  }
}