resource "aws_eip" "nat_gw_elastic_ip" {
  tags = merge(
    local.common_tags,
    {
      Name     = "${var.environment}-${var.project}-nat-eip"
      Resource = "nat_gw_elastic_ip"
    },
  )
}