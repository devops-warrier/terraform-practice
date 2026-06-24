variable "ami_id" {
  type    = string
  default = "ami-0220d79f3f480ecf5"
}

variable "project" {
  type    = string
  default = "roboshop"
}

variable "environment" {
  type    = string
  default = "dev"
}


variable "instances" {
  type    = list(any)
  default = ["mongodb", "redis", "rabitmq", "mysql"]
}


variable "instance_type" {
  type    = string
  default = "t3.micro"

  validation {
    condition     = contains(["t3.micro", "t3.small", "t3.large", "t3.medium"], var.instance_type)
    error_message = "you need to pass only t3.micro or t3.small"
  }
}

variable "sg_name" {
  type    = string
  default = "roboshop"
}

variable "port" {
  default = 0
  type    = number
}

variable "cidr" {
  type    = list(any)
  default = ["0.0.0.0/0"]
}
