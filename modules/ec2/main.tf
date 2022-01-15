data "aws_ami" "ubuntu_bionic_ami" {
  most_recent = true
  owners      = ["${var.id_compte_ubuntu}"]

  filter {
    name   = "name"
    values = ["${var.nom_ubuntu_ami}"]
  }
}

resource "aws_instance" "gestionglasses-ec2" {
  ami               = data.aws_ami.ubuntu_bionic_ami.id
  instance_type     = var.type_instance
  key_name          = var.cle_ssh
  availability_zone = var.zone_dispo
  security_groups   = ["${var.securite_groupe}"]
  tags = {
    Name = "${var.ec2_name}-ec2"
  }

  provisioner "local-exec" {
    command = " echo L'application est lancé sur cette url : http://${var.ip_public}:8080/ >> ip_connection.txt"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install software-properties-common",
      "sudo add-apt-repository --yes --update ppa:ansible/ansible",
      "sudo apt install --yes ansible",
      "git clone https://github.com/${var.git_proprietaire}/${var.git_projet}.git",
      "cd ${var.git_projet}",
      "ansible-galaxy install -r requirements.yml --force",
      "ansible-playbook -i hosts.yml gestionGlasses.yml"
    ] 
    connection {
      type        = "ssh"
      user        = "${var.utilisateur_ssh}"
      private_key = file("../.aws/${var.cle_ssh}.pem")
      host        = "${self.public_ip}"
    }
  }


}

