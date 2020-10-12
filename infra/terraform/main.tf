data "aws_ami" "jenkins-ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-20200908"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

resource "aws_instance" "jenkins-ec2" {
  ami           = data.aws_ami.jenkins-ami.id
  instance_type = "t2.micro"
  depends_on = [module.db]

  vpc_security_group_ids = [var.rds_security_group]
  subnet_id = var.subnet_ids[0]
  key_name = var.key_name

  tags = {
    Name = "Jenkins-Terraform"
  }

  provisioner "local-exec" {
    command = <<EOT
      sleep 60;
      cd ansible;
      > jenkins-ci.ini;
      echo "[jenkins-ci]" | tee -a jenkins-ci.ini;
      echo "${aws_instance.jenkins-ec2.public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=${var.private_key}" | tee -a jenkins-ci.ini;
      export ANSIBLE_HOST_KEY_CHECKING=False;
      ansible-playbook -vvv -i jenkins-ci.ini playbook.yml -e aws_rds_url="${module.db.this_db_instance_address}" -e aws_rds_user="${var.username}" -e aws_rds_password="${var.password}"
    EOT
  }
}

module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 2.0"

  identifier = "sfia2-rds"

  engine            = "mysql"
  engine_version    = var.engine_version
  instance_class    = var.instance_class
  allocated_storage = 5

  username = var.username
  password = var.password
  port     = "3306"

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  iam_database_authentication_enabled = true

  vpc_security_group_ids = [var.rds_security_group]

  # DB subnet group
  subnet_ids = var.subnet_ids

  # DB parameter group
  family = var.family

  # DB option group
  major_engine_version = var.major_version
}
