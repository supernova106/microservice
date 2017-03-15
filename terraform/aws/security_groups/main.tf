variable "short_name" {}
variable "vpc_id" {}

resource "aws_security_group" "control" {
  name = "${var.short_name}-control"
  description = "Allow inbound traffic for control nodes"
  vpc_id = "${var.vpc_id}"

  ingress { # SSH
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress { # HTTP
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress { # HTTPS
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress { # TCP
    from_port = 7070
    to_port = 7070
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress { # Netdata Port
    from_port = 19999
    to_port = 19999
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_security_group" "worker" {
  name = "${var.short_name}-worker"
  description = "Allow inbound traffic for worker nodes"
  vpc_id = "${var.vpc_id}"

  ingress { # SSH
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress { # HTTP
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress { # HTTPS
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress { # TCP
    from_port = 7070
    to_port = 7070
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress { # TCP
    from_port = 7070
    to_port = 7070
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress { # Netdata Port
    from_port = 19999
    to_port = 19999
    protocol = "tcp"
    cidr_blocks = ["203.117.101.50/32"]
  }

}

resource "aws_security_group" "edge" {
  name = "${var.short_name}-edge"
  description = "Allow inbound traffic for edge nodes"
  vpc_id = "${var.vpc_id}"

  ingress { # SSH
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress { # HTTP
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress { # HTTPS
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress { # Graylog rest api port
    from_port = 9000
    to_port = 9000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress { # Netdata Port
    from_port = 19999
    to_port = 19999
    protocol = "tcp"
    cidr_blocks = ["203.117.101.50/32"]
  }

}

resource "aws_security_group" "elb" {
  name = "${var.short_name}-elb"
  description = "controls access to the application ELB"
  vpc_id = "${var.vpc_id}"

  ingress { #TCP
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_security_group" "alb" {
  name = "${var.short_name}-alb"
  description = "controls access to the application ELB"
  vpc_id = "${var.vpc_id}"

  ingress { # HTTP
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress { # HTTPS
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_security_group" "inner" {
  name = "${var.short_name}-inner"
  description = "Allow inbound traffic for all ports"
  vpc_id = "${var.vpc_id}"

  ingress {
    from_port=0
    to_port=65535
    protocol = "tcp"
    self = true
  }

  ingress {
    from_port=0
    to_port=65535
    protocol = "udp"
    self = true
  }

  ingress { # ICMP
    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "inner_security_group" {
  value = "${aws_security_group.inner.id}"
}

output "control_security_group" {
  value = "${aws_security_group.control.id}"
}

output "worker_security_group" {
  value = "${aws_security_group.worker.id}"
}

output "edge_security_group" {
  value = "${aws_security_group.edge.id}"
}

output "alb_security_group" {
  value = "${aws_security_group.alb.id}"
}

output "elb_security_group" {
  value = "${aws_security_group.elb.id}"
}
