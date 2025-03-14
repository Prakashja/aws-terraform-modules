resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.vpc.id
  count      = length(var.public_subnets) > 0 ? length(var.public_subnets) : 0
  cidr_block = var.public_subnets[count.index]
  availability_zone = length(regexall("^[a-z]{2}-", element(var.azs, count.index ) )) > 0 ? element(var.azs, count.index ): null
  tags = merge(
    {
      "Name" = format(
        "%s-${var.public_subnet_suffix}-%s",
        var.environment,
        element(var.azs, count.index )
      )
      "Tier" = "Public"
    }
  )
  depends_on = [aws_vpc.vpc]

}

output "public_subnets" {
  value = aws_subnet.public[*].id
}