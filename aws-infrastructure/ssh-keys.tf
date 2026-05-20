resource "tls_private_key" "webserver_management" {
  algorithm = "ED25519"
}

resource "aws_key_pair" "webserver_public_key" {
  key_name = "webserver-management"
  public_key = tls_private_key.webserver_management.public_key_openssh
}

resource "local_file" "webserver_private_key" {
  filename = "${path.module}/ssh/webserver-management.pem"
  content = tls_private_key.webserver-management.private_key_openssh
  file_permission = "0600"
}
