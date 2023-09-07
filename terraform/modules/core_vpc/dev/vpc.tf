#vpc
resource "aws_vpc" "jenkins_vpc" {
    cidr_block = var.vpc_cidr
    tags = merge(
        tomap({Name = "${var.tags["project"]}-vpc"}),
        var.tags
    )
}

#subnets
resource "aws_subnet" "public_subnets" {
    count = length(var.az)
    vpc_id = aws_vpc.jenkins_vpc.id
    availability_zone = var.az[count.index]
    cidr_block = var.public_subnets_cidr[count.index]
    map_public_ip_on_launch = true
    tags = merge(
        tomap({Name = "${var.tags["project"]}-public-subnet-${var.az[count.index]}"}),
        var.tags
    )
}

resource "aws_subnet" "private_subnets" {
    count = length(var.az)
    vpc_id = aws_vpc.jenkins_vpc.id
    availability_zone = var.az[count.index]
    cidr_block = var.private_subnets_cidr[count.index]
    map_public_ip_on_launch = true
    tags = merge(
        tomap({Name = "${var.tags["project"]}-private-subnet-${var.az[count.index]}"}),
        var.tags
    )
}

#igw
resource "aws_internet_gateway" "jenkins_igw" {
    vpc_id = aws_vpc.jenkins_vpc.id
    tags = merge(
        tomap({Name = "${var.tags["project"]}-igw"})
    )
}

#route table configuration
resource "aws_route_table" "jenkins_public_rt" {
    vpc_id = aws_vpc.jenkins_vpc.id
    tags = merge(
        tomap({Name = "${var.tags["project"]}-public-rt"}),
        var.tags
    )
}

resource "aws_route_table_association" "jenkins_public_rt_assc" {
    count = length(var.public_subnets_cidr)
    route_table_id = aws_route_table.jenkins_public_rt.id
    subnet_id = aws_subnet.public_subnets[count.index].id
}

resource "aws_route" "public_rt_toute" {
    route_table_id = aws_route_table.jenkins_public_rt.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.jenkins_igw.id
}