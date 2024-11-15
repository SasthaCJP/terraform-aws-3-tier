# main.tf

provider "aws" {
  region = var.region
}

# Create VPC
resource "aws_vpc" "sss_vpc" {
  cidr_block = var.vpc_cidr_block

  tags = merge(var.tags, { Name = "sss-vpc" }) # Add explicit Name tag here
}


# Create Public Subnets
resource "aws_subnet" "sss_public_web_subnet_1" {
  vpc_id                  = aws_vpc.sss_vpc.id
  cidr_block              = var.public_subnet_cidrs[0]
  availability_zone       = "us-east-2a"
  map_public_ip_on_launch = true
  tags                    = merge(var.tags, { Name = "sss-public-web-subnet-1" })
}

resource "aws_subnet" "sss_public_web_subnet_2" {
  vpc_id                  = aws_vpc.sss_vpc.id
  cidr_block              = var.public_subnet_cidrs[1]
  availability_zone       = "us-east-2b"
  map_public_ip_on_launch = true
  tags                    = merge(var.tags, { Name = "sss-public-web-subnet-2" })
}

resource "aws_subnet" "sss_public_web_subnet_3" {
  vpc_id                  = aws_vpc.sss_vpc.id
  cidr_block              = var.public_subnet_cidrs[2]
  availability_zone       = "us-east-2c"
  map_public_ip_on_launch = true
  tags                    = merge(var.tags, { Name = "sss-public-web-subnet-3" })
}

# Create Private Application Subnets
resource "aws_subnet" "sss_private_app_subnet_1" {
  vpc_id            = aws_vpc.sss_vpc.id
  cidr_block        = var.private_app_subnet_cidrs[0]
  availability_zone = "us-east-2a"
  tags              = merge(var.tags, { Name = "sss-private-app-subnet-1" })
}

resource "aws_subnet" "sss_private_app_subnet_2" {
  vpc_id            = aws_vpc.sss_vpc.id
  cidr_block        = var.private_app_subnet_cidrs[1]
  availability_zone = "us-east-2b"
  tags              = merge(var.tags, { Name = "sss-private-app-subnet-2" })
}

resource "aws_subnet" "sss_private_app_subnet_3" {
  vpc_id            = aws_vpc.sss_vpc.id
  cidr_block        = var.private_app_subnet_cidrs[2]
  availability_zone = "us-east-2c"
  tags              = merge(var.tags, { Name = "sss-private-app-subnet-3" })
}

# Create Private DB Subnets
resource "aws_subnet" "sss_private_db_subnet_1" {
  vpc_id            = aws_vpc.sss_vpc.id
  cidr_block        = var.private_db_subnet_cidrs[0]
  availability_zone = "us-east-2a"
  tags              = merge(var.tags, { Name = "sss-private-db-subnet-1" })
}

resource "aws_subnet" "sss_private_db_subnet_2" {
  vpc_id            = aws_vpc.sss_vpc.id
  cidr_block        = var.private_db_subnet_cidrs[1]
  availability_zone = "us-east-2b"
  tags              = merge(var.tags, { Name = "sss-private-db-subnet-2" })
}

resource "aws_subnet" "sss_private_db_subnet_3" {
  vpc_id            = aws_vpc.sss_vpc.id
  cidr_block        = var.private_db_subnet_cidrs[2]
  availability_zone = "us-east-2c"
  tags              = merge(var.tags, { Name = "sss-private-db-subnet-3" })
}

# Create Route Tables
resource "aws_route_table" "sss_public_web_route_table" {
  vpc_id = aws_vpc.sss_vpc.id
  tags   = merge(var.tags, { Name = "sss-public-web-route-table" })
}

resource "aws_route_table" "sss_private_app_route_table" {
  vpc_id = aws_vpc.sss_vpc.id
  tags   = merge(var.tags, { Name = "sss-private-app-route-table" })
}

resource "aws_route_table" "sss_private_db_route_table" {
  vpc_id = aws_vpc.sss_vpc.id
  tags   = merge(var.tags, { Name = "sss-private-db-route-table" })
}

# Associate Route Tables with Subnets
resource "aws_route_table_association" "public_subnet_1_association" {
  subnet_id      = aws_subnet.sss_public_web_subnet_1.id
  route_table_id = aws_route_table.sss_public_web_route_table.id
}

resource "aws_route_table_association" "public_subnet_2_association" {
  subnet_id      = aws_subnet.sss_public_web_subnet_2.id
  route_table_id = aws_route_table.sss_public_web_route_table.id
}

resource "aws_route_table_association" "public_subnet_3_association" {
  subnet_id      = aws_subnet.sss_public_web_subnet_3.id
  route_table_id = aws_route_table.sss_public_web_route_table.id
}

resource "aws_route_table_association" "private_app_subnet_1_association" {
  subnet_id      = aws_subnet.sss_private_app_subnet_1.id
  route_table_id = aws_route_table.sss_private_app_route_table.id
}

resource "aws_route_table_association" "private_app_subnet_2_association" {
  subnet_id      = aws_subnet.sss_private_app_subnet_2.id
  route_table_id = aws_route_table.sss_private_app_route_table.id
}

resource "aws_route_table_association" "private_app_subnet_3_association" {
  subnet_id      = aws_subnet.sss_private_app_subnet_3.id
  route_table_id = aws_route_table.sss_private_app_route_table.id
}

resource "aws_route_table_association" "private_db_subnet_1_association" {
  subnet_id      = aws_subnet.sss_private_db_subnet_1.id
  route_table_id = aws_route_table.sss_private_db_route_table.id
}

resource "aws_route_table_association" "private_db_subnet_2_association" {
  subnet_id      = aws_subnet.sss_private_db_subnet_2.id
  route_table_id = aws_route_table.sss_private_db_route_table.id
}

resource "aws_route_table_association" "private_db_subnet_3_association" {
  subnet_id      = aws_subnet.sss_private_db_subnet_3.id
  route_table_id = aws_route_table.sss_private_db_route_table.id
}

# Create Internet Gateway
resource "aws_internet_gateway" "sss_igw" {
  vpc_id = aws_vpc.sss_vpc.id
  tags   = merge(var.tags, { Name = "sss-igw" })
}

# Create NAT Gateway (Elastic IP required)
resource "aws_eip" "sss_nat_eip" {
  vpc  = true
  tags = merge(var.tags, { Name = "sss-nat-eip" })
}

resource "aws_nat_gateway" "sss_nat_gateway" {
  allocation_id = aws_eip.sss_nat_eip.id
  subnet_id     = aws_subnet.sss_public_web_subnet_1.id
  tags          = merge(var.tags, { Name = "sss-nat-gateway" })
}

# Create Routes for Public, Private Application, and Private DB Route Tables
resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.sss_public_web_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.sss_igw.id
}

resource "aws_route" "private_app_route" {
  route_table_id         = aws_route_table.sss_private_app_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.sss_nat_gateway.id
}

resource "aws_route" "private_db_route" {
  route_table_id         = aws_route_table.sss_private_db_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.sss_nat_gateway.id
}
