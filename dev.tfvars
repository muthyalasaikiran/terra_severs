var.vpc_cidr = "10.0.0.0/16"
var.subnames = [ "dev1", "production2", ]
var.web_config = {
  name        = "dev"
    description = "this security grp"
    rules = [{
      type        = "ingress"
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    }]
  }
  
var.app_config = {
  name        = "production"
    description = "this security grp"
    rules = [{
      type        = "ingress"
      from_port   = 8080
      to_port     = 8080
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    }]
  }