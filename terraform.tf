provider "aws"{
profile = "default"
region = "us-east-2"
}
resource "aws_instance" "devang_terraform"{
ami = "ami-05d72852800cbf29e"
instance_type = "t2.micro"
key_name = "terrakeyp"
}
