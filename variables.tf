variable "aws_region" {
  type    = string
  default = "us-east-2"
}

variable "imageec2" {
  type    = string
  default = "ami-001089eb624938d9f"
}

variable "tags_ec2" {
  type = map(string)
  default = {
    Name = "ec2-terraform"
  }
}


variable "id_s3" {
  type    = string
  default = "exemplo"
}