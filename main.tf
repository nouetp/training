#
# DO NOT DELETE THESE LINES!
#
# Your AMI ID is:
#
#     ami-66506c1c
#
# Your subnet ID is:
#
#     subnet-ce92e593
#
# Your security group ID is:
#
#     sg-3ee83749
#
# Your Identity is:
#
#     customer-training-cheetah
#

variable "aws_access_key" {
  type = "string"
}

variable "aws_secret_key" {
  type = "string"
}

variable "aws_region" {
  type    = "string"
  default = "us-west-2"
}

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}

resource "aws_instance" "web" {
  ami                    = "ami-66506c1c"
  instance_type          = "t2.micro"
#  subnet_id              = "subnet-ce92e593"
  vpc_security_group_ids = ["sg-3ee83749"]
 # count                  = 2

  tags {
    Identity = "customer-training-cheetah"
    Name     = "Yo, this is my name"
    Bugs     = "Bunny"
  }
}

#module "example" { 
#	source = "./example-module"
#	command = "bash -s 'echo yo, another command'"
#  }


#output "public_dns" {
#  value = "${aws_instance.web.*.public_dns}"
#}

#80WT8nFCeiDugQ.atlasv1.kxfI90cpqUelEeQi8oWwymXhgu9MnxF80S72jLJiIoQ5F5LITzz1rVRjWzTPXiVSezs

terraform { 
  backend "atlas" {
    name = "nouetp/pinnacol"
    }
  }
