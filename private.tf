resource "aws_subnet" "eks_subnet_private-1a" {
  vpc_id                  = aws_vpc.eks_vpc.id               #dependencia, primeiro precisa criar a vpc
  cidr_block              = cidrsubnet(var.cidr_block, 8, 3) 
  availability_zone       = "${data.aws_region.current.name}a"
  tags = merge(
    local.tags,
    {
      Name                     = "${var.project_name}.-priv-subnet-1a",
      "kubernetes.io/role/internal-elb" = 1
    }
  )
}

resource "aws_subnet" "eks_subnet_private-1b" {
  vpc_id                  = aws_vpc.eks_vpc.id               #dependencia, primeiro precisa criar a vpc
  cidr_block              = cidrsubnet(var.cidr_block, 8, 4) 
  availability_zone       = "${data.aws_region.current.name}b"
  tags = merge(
    local.tags,
    {
      Name                     = "${var.project_name}.-priv-subnet-1b",
      "kubernetes.io/role/internal-elb" = 1
    }
  )
}

# input entrada - terraform plan -var 'cidr_block=10.0.0.0/16'
# terrafom plan -var-file terraform.tfvars