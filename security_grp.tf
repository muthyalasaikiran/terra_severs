resource "aws_security_group" "dev" {
  name        = var.web_config.name
  description = var.web_config.description
  vpc_id      = aws_vpc.terra_vpc.id
}
resource "aws_security_group_rule" "dev_sg_rule" {
  count  =    length(var.web_config)
  type              = var.web_config.rules[count.index].type
  from_port         = var.web_config.rules[count.index].from_port
  to_port           = var.web_config.rules[count.index].to_port
  protocol          = var.web_config.rules[count.index].protocol
  cidr_blocks       = [var.web_config.rules[count.index].cidr_blocks]
  security_group_id = aws_security_group.web.id
}
resource "aws_security_group" "pro" {
  name        = var.app_config.name
  description = var.app_config.description
  vpc_id      = aws_vpc.terra_vpc.id
}
resource "aws_security_group_rule" "production_sg_rule" {
  count  =    length(var.app_config)
  type              = var.app_config.rules[count.index].type
  from_port         = var.app_config.rules[count.index].from_port
  to_port           = var.app_config.rules[count.index].to_port
  protocol          = var.app_config.rules[count.index].protocol
  cidr_blocks       = [var.app_config.rules[count.index].cidr_blocks]
  security_group_id = aws_security_group.app.id
}
