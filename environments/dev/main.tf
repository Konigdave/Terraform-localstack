module "s3" {
  source      = "../../modules/s3"
  bucket_name = "${var.bucket_name}"
}

module "vpc" {
  source = "../../modules/vpc"

  cidr_block           = var.cidr_block
  public_subnet_cidr   = var.public_subnet_cidr
  private_subnet_cidr  = var.private_subnet_cidr
}

module "public_ec2" {
  source = "../../modules/ec2"

  subnet_id     = module.vpc.public_subnet_id
  ami_id        = var.ami_id
  instance_type = var.instance_type
  security_group_id = module.sg.security_group_id
  key_name      = aws_key_pair.this.key_name
}
#tags

module "private_ec2" {
  source = "../../modules/ec2"

  subnet_id     = module.vpc.private_subnet_id
  ami_id        = var.ami_id
  instance_type = var.instance_type
  security_group_id = module.sg.security_group_id
  key_name      = aws_key_pair.this.key_name
}

module "sg" {
  source = "../../modules/security_group"

  vpc_id = module.vpc.vpc_id
}

resource "aws_key_pair" "this" {
  key_name   = "terraform-${var.env}-key"
  public_key = file("${path.root}/../../keys/terraform-${var.env}-key.pub")
}
