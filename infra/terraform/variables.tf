variable "region" {
  default = "eu-west-2"
}

variable "instance_class" {
  default = "db.t2.micro"
}

variable "engine_version" {
  default = "8.0.20"
}

variable "family" {
  default = "mysql8.0"
}

variable "major_version" {
  default = "8.0"
}

variable "rds_security_group" {
  default = "sg-0ab54bb4aef9a0b71"
}

variable "subnet_ids" {
  type    = list
  default = ["subnet-05fe6892041d0b173", "subnet-03b852967af7bc114", "subnet-012f1375c98a52040"]
}

variable "username" {
  default = "admin"
}

variable "password" {
  default = "password"
}

variable "key_name" {
  default = "Jenkins-aws"
}

variable "private_key" {
  default = "Jenkins-aws.pem"
}