variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "cidr range for vpc"
}


variable "subnames" {
  type    = list(string)
  default = ["web1", "app2"]

}


variable "dev_config" {
  type = object({
    name        = string
    description = string
    rules = list(object({
      type        = string
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = string
    }))
  })
  default = {
    name        = "dev"
    description = "this security grp"
    rules = [{
      type        = "ingress"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
      },
      {
        type        = "ingress"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks  = "0.0.0.0/0"
      }]
  }

}


variable "pro_config" {
  type = object({
    name        = string
    description = string
    rules = list(object({
      type        = string
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks = string
    }))
  })
  default = {
    name        = "pro"
    description = "this security grp"
    rules = [{
      type        = "ingress"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
      },
      {
        type        = "ingress"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks  = "0.0.0.0/0"
      }]
  }

}