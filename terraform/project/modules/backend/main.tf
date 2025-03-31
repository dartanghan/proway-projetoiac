data "aws_ami" "imagem_ec2" {
    most_recent = true
    owners = [ "amazon" ]
    filter {
      name = "name"
      values = [ "al2023-ami-2023.*-x86_64" ]
    }
}

resource "aws_security_group" "backend_sg" {
    vpc_id = var.vpc_id
    name = "backend_sg"
    tags = {
      Name = "back-end_sg"
    }
}

resource "aws_vpc_security_group_egress_rule" "egress_sg_rule" {
  security_group_id = aws_security_group.backend_sg.id
  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"
} 

resource "aws_vpc_security_group_ingress_rule" "ingress_80_sg_rule" {
  security_group_id = aws_security_group.backend_sg.id
  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "tcp"
  from_port   = 5000
  to_port     = 5000
}
resource "aws_vpc_security_group_ingress_rule" "ingress_22_sg_rule" {
  security_group_id = aws_security_group.backend_sg.id
  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "tcp"
  from_port   = 22
  to_port     = 22
}

resource "aws_instance" "backend_ec2" {
  instance_type = "t3.micro"
  ami = data.aws_ami.imagem_ec2.id
  subnet_id = var.sn_priv01
  vpc_security_group_ids = [ aws_security_group.backend_sg.id ]
  key_name = aws_key_pair.lb_ssh_key_pair.key_name
  associate_public_ip_address = true
  tags = {
    Name = "back-end_ec2"
  }
  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install python3 python3-pip git -y
    sudo systemctl enable rc-local
    mkdir /proway
    echo '#!/bin/bash' > /opt/rc.proway
    echo "cd /proway" >> /opt/rc.proway
    echo "git init" >> /opt/rc.proway
    echo "git config core.sparseCheckout true" >> /opt/rc.proway
    echo "git remote add -f origin https://github.com/dartanghan/proway-projetoiac" >> /opt/rc.proway
    echo "echo "back-end/*" >> .git/info/sparse-checkout" >> /opt/rc.proway
    echo "git checkout main && git pull origin main" >> /opt/rc.proway
    echo "cd back-end && pip install -r requirements.txt" >> /opt/rc.proway
    echo "cd /proway/back-end/ && flask --app application.py run -h 0.0.0.0" >> /opt/rc.proway
    chmod +x /opt/rc.proway
    /opt/rc.proway
    cp /proway/back-end/backend.service /etc/systemd/system/
    systemctl enable backend.service
    systemctl start backend.service
    reboot
  EOF
}

# Criacao da chave SSH que sera usada para conexao na instancia
resource "tls_private_key" "lb_ssh_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}
resource "aws_key_pair" "lb_ssh_key_pair" {
  key_name   = "key_pair"
  public_key = tls_private_key.lb_ssh_key.public_key_openssh
}