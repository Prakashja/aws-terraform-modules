resource "aws_subnet" "private_a" {
  vpc_id     = aws_vpc.vpc.id
  count      = length(var.private_subnets_a) > 0 ? length(var.private_subnets_a) : 0
  cidr_block = var.private_subnets_a[count.index]
  availability_zone = length(regexall("^[a-z]{2}-", element(var.azs, count.index ) )) > 0 ? element(var.azs, count.index ): null
  tags = merge(
    {
      "Name" = format(
        "%s-${var.private_subnet_suffix_a}-%s",
        var.environment,
        element(var.azs, count.index )
      )
      "Tier" = "Private"
    }
  )
 depends_on = [aws_vpc.vpc]
}
