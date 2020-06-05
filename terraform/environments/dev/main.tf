provider "aws" {
  version = "~> 2.0"
  region  = "us-east-2"
}

resource "aws_instance" "web" {
  ami           = "ami-026dea5602e368e96"
  instance_type = "t2.micro"

  tags = {
    Name = "myinstance"
    ENV = "dev"
  }
}

output "instance_id" {
  value = aws_instance.web.id
}