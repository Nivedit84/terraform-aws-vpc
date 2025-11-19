resource "aws_vpc" "demo-vpc" {
    cidr_block = var.cidr_block
}

resource "aws_subnet" "public_subnet_1" {
    vpc_id = aws_vpc.demo-vpc.id
    cidr_block = var.public_subnet_1
    availability_zone = "ap-south-1a"
}

resource "aws_subnet" "public_subnet_2" {
    vpc_id = aws_vpc.demo-vpc.id
    cidr_block = var.public_subnet_2
    availability_zone = "ap-south-1b"
}

resource "aws_subnet" "public_subnet_3" {
  vpc_id            = aws_vpc.demo-vpc.id
  cidr_block        = var.public_subnet_3
  availability_zone = "ap-south-1c"
}

resource "aws_route_table" "demo-rt" {
    vpc_id = aws_vpc.demo-vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.demo_igw.id
    }
}

resource "aws_route_table" "demo-rt1" {
    vpc_id = aws_vpc.demo-vpc.id

  route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.demo_igw.id
    }
}
resource "aws_route_table" "demo-rt2" {
    vpc_id = aws_vpc.demo-vpc.id

  route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.demo_igw.id
    }
}


resource "aws_internet_gateway" "demo_igw" {
    vpc_id = aws_vpc.demo-vpc.id
}

resource "aws_route_table_association" "demo-rta" {
    subnet_id = aws_subnet.public_subnet_1.id
    route_table_id = aws_route_table.demo-rt.id
}

resource "aws_route_table_association" "demo-rta1" {
    subnet_id = aws_subnet.public_subnet_2.id
    route_table_id = aws_route_table.demo-rt1.id
}
resource "aws_route_table_association" "demo-rta2" {
    subnet_id = aws_subnet.public_subnet_3.id
    route_table_id = aws_route_table.demo-rt2.id
}

output "public_subnet_1" {
  value = aws_subnet.public_subnet_1.id
}
output "public_subnet_2" {
  value = aws_subnet.public_subnet_2.id
}

output "public_subnet_3" {
  value = aws_subnet.public_subnet_3.id
}