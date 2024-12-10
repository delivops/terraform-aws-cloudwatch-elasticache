data "aws_elasticache_cluster" "elasticache_cluster" {
  cluster_id = var.cache_cluster_id
}
locals {
  cache_nodes_ids = [
    for node in data.aws_elasticache_cluster.elasticache_cluster.cache_nodes : tostring(node.id)
  ]
}
