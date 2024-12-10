resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  count                     = var.high_cpu_enabled ? 1 : 0
  alarm_name                = "ElastiCache | ${var.cache_cluster_id} | High CPU Utilization"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = 5
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/ElastiCache"
  period                    = 60
  statistic                 = "Average"
  threshold                 = var.high_cpu_threshold
  alarm_description         = "High CPU utilization in ${var.cache_cluster_id}"
  alarm_actions             = [var.aws_sns_topic_arn]
  ok_actions                = [var.aws_sns_topic_arn]
  datapoints_to_alarm       = 5
  insufficient_data_actions = []
  dimensions = {
    CacheClusterId = var.cache_cluster_id
  }
  tags = merge(var.tags, {
    "CacheClusterId" = var.cache_cluster_id,
    "Terraform"      = "true"
  })

}
resource "aws_cloudwatch_metric_alarm" "high_connection" {
  for_each                  = toset(local.cache_nodes_ids) * var.high_connection_enabled ? 1 : 0
  alarm_name                = "ElastiCache | ${var.cache_cluster_id}/${each.value} | High Connection"
  comparison_operator       = "LessThanThreshold"
  evaluation_periods        = 10
  datapoints_to_alarm       = 10
  metric_name               = "CurrConnections"
  namespace                 = "AWS/ElastiCache"
  period                    = 60
  statistic                 = "Average"
  threshold                 = (var.high_connection_threshold / 100) * 65000
  alarm_description         = "Average connections node ${each.value} in cluster ${var.cache_cluster_id} is too high"
  alarm_actions             = [var.aws_sns_topic_arn]
  ok_actions                = [var.aws_sns_topic_arn]
  insufficient_data_actions = []
  dimensions = {
    CacheClusterId = var.cache_cluster_id
    CacheNodeId    = each.value
  }
  tags = merge(var.tags, {
    "CacheClusterId" = var.cache_cluster_id,
    "Terraform"      = "true"
  })

}

resource "aws_cloudwatch_metric_alarm" "high_memory" {
  count                     = var.high_memory_enabled ? 1 : 0
  alarm_name                = "ElastiCache | ${var.cache_cluster_id} | High Memory Usage"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = "5"
  metric_name               = "DatabaseMemoryUsagePercentage"
  namespace                 = "AWS/ElastiCache"
  period                    = 60
  statistic                 = "Average"
  threshold                 = var.high_memory_threshold
  alarm_description         = "High Memory in ${var.cache_cluster_id}"
  alarm_actions             = [var.aws_sns_topic_arn]
  ok_actions                = [var.aws_sns_topic_arn]
  insufficient_data_actions = []

  dimensions = {
    CacheClusterId = var.cache_cluster_id
  }
  tags = merge(var.tags, {
    "CacheClusterId" = var.cache_cluster_id,
    "Terraform"      = "true"
  })

}

resource "aws_cloudwatch_metric_alarm" "high_engine_cpu" {
  count                     = var.high_engine_cpu_enabled ? 1 : 0
  alarm_name                = "ElastiCache | ${var.cache_cluster_id} | High Engine CPU Utilization"
  alarm_description         = "High CPU Engine in ${var.cache_cluster_id}"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = "5"
  metric_name               = "EngineCPUUtilization"
  namespace                 = "AWS/ElastiCache"
  period                    = 60
  statistic                 = "Maximum"
  threshold                 = var.high_engine_cpu_threshold
  alarm_actions             = [var.aws_sns_topic_arn]
  ok_actions                = [var.aws_sns_topic_arn]
  insufficient_data_actions = []
  dimensions = {
    CacheClusterId = var.cache_cluster_id
  }
  tags = merge(var.tags, {
    "CacheClusterId" = var.cache_cluster_id,
    "Terraform"      = "true"
  })
}

resource "aws_cloudwatch_metric_alarm" "high_replication_lag" {
  count                     = var.high_replication_lag_enabled ? 1 : 0
  alarm_name                = "ElastiCache | ${var.cache_cluster_id} | High Replication Lag"
  alarm_description         = "High Replication lag in ${var.cache_cluster_id}"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = "5"
  metric_name               = "ReplicationLag"
  namespace                 = "AWS/ElastiCache"
  period                    = 60
  statistic                 = "Maximum"
  threshold                 = var.high_replication_lag_threshold
  alarm_actions             = [var.aws_sns_topic_arn]
  ok_actions                = [var.aws_sns_topic_arn]
  insufficient_data_actions = []
  dimensions = {
    CacheClusterId = var.cache_cluster_id
  }
  tags = merge(var.tags, {
    "CacheClusterId" = var.cache_cluster_id,
    "Terraform"      = "true"
  })
}
