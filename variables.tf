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

variable "sg_lb" {
  type    = list(string)
  default = ["sg-0bc41796ed8a952f2"]
}


variable "subnets_lb" {
  type    = list(string)
  default = ["subnet-0e5e136aa686c7336", "subnet-01eb577852a061ca1", "subnet-0b8ec0c0cc65e83fe"]
}
