resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr
  tags       = merge(var.tags, { Name = "${var.tags["Name"]}-vpc" })
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.this.id
  tags   = merge(var.tags, { Name = "${var.tags["Name"]}-igw" })
}

resource "aws_subnet" "public" {
  for_each = { for idx, cidr in var.public_subnets : idx => cidr }
  vpc_id            = aws_vpc.this.id
  cidr_block        = each.value
  availability_zone = element(var.azs, tonumber(each.key) % length(var.azs))
  map_public_ip_on_launch = true
  tags = merge(var.tags, { Name = "${var.tags["Name"]}-public-${each.key}" })
}

resource "aws_subnet" "private" {
  for_each = { for idx, cidr in var.private_subnets : idx => cidr }
  vpc_id            = aws_vpc.this.id
  cidr_block        = each.value
  availability_zone = element(var.azs, tonumber(each.key) % length(var.azs))
  map_public_ip_on_launch = false
  tags = merge(var.tags, { Name = "${var.tags["Name"]}-private-${each.key}" })
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id
  tags   = merge(var.tags, { Name = "${var.tags["Name"]}-public-rt" })
}

resource "aws_route" "public_internet_access" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public_assoc" {
  for_each      = aws_subnet.public
  subnet_id     = each.value.id
  route_table_id = aws_route_table.public.id
}