resource "aws_security_group" "sg" {
  name        = "${var.auteur}-sg"
  description = "${var.description_sg_group}"

  ingress {
    description      = "${var.description_ssh}"
    from_port        = var.port_ssh
    to_port          = var.port_ssh
    protocol         = "${var.protocol}"
    cidr_blocks      = ["${var.cidr_blocks}"]
    ipv6_cidr_blocks = ["${var.ipv6_cidr_blocks}"]
  }

  ingress {
    description      = "${var.description_http}"
    from_port        = var.port_http
    to_port          = var.port_http
    protocol         = "${var.protocol}"
    cidr_blocks      = ["${var.cidr_blocks}"]
    ipv6_cidr_blocks = ["${var.ipv6_cidr_blocks}"]
  }

  ingress {
    description      = "${var.description_https}"
    from_port        = var.port_https
    to_port          = var.port_https
    protocol         = "${var.protocol}"
    cidr_blocks      = ["${var.cidr_blocks}"]
    ipv6_cidr_blocks = ["${var.ipv6_cidr_blocks}"]
  }

  egress {
    description      = "${var.description_egress}"
    from_port        = var.port_egress
    to_port          = var.port_egress
    protocol         = "${var.protocol_egress}"
    cidr_blocks      = ["${var.cidr_blocks}"]
    ipv6_cidr_blocks = ["${var.ipv6_cidr_blocks}"]
  }

  
  ingress {
    description      = "${var.description_spring_app}"
    from_port        = var.port_spring
    to_port          = var.port_spring
    protocol         = "${var.protocol}"
    cidr_blocks      = ["${var.cidr_blocks}"]
    ipv6_cidr_blocks = ["${var.ipv6_cidr_blocks}"]
  }

  egress {
    description      = "${var.description_egress}"
    from_port        = var.port_egress
    to_port          = var.port_egress
    protocol         = "${var.protocol_egress}"
    cidr_blocks      = ["${var.cidr_blocks}"]
    ipv6_cidr_blocks = ["${var.ipv6_cidr_blocks}"]
  }

  ingress {
    description      = "${var.description_mysql}"
    from_port        = var.port_mysql
    to_port          = var.port_mysql
    protocol         = "${var.protocol}"
    cidr_blocks      = ["${var.cidr_blocks}"]
    ipv6_cidr_blocks = ["${var.ipv6_cidr_blocks}"]
  }

  egress {
    description      = "${var.description_egress}"
    from_port        = var.port_egress
    to_port          = var.port_egress
    protocol         = "${var.protocol_egress}"
    cidr_blocks      = ["${var.cidr_blocks}"]
    ipv6_cidr_blocks = ["${var.ipv6_cidr_blocks}"]
  }

    ingress {
    description      = "${var.description_phpmyadmin}"
    from_port        = var.port_phpmyadmin
    to_port          = var.port_phpmyadmin
    protocol         = "${var.protocol}"
    cidr_blocks      = ["${var.cidr_blocks}"]
    ipv6_cidr_blocks = ["${var.ipv6_cidr_blocks}"]
  }

  egress {
    description      = "${var.description_egress}"
    from_port        = var.port_egress
    to_port          = var.port_egress
    protocol         = "${var.protocol_egress}"
    cidr_blocks      = ["${var.cidr_blocks}"]
    ipv6_cidr_blocks = ["${var.ipv6_cidr_blocks}"]
  }

  tags = {
    Name = "${var.auteur}-sg"
  }
}
