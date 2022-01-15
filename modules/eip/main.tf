resource "aws_eip" "ip_public" {
  vpc      = true
  tags = {
    Name = "${var.auteur}-eip"
  }
}
