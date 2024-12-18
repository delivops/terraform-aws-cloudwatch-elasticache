resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  count                     = var.high_cpu_enabled ? 1 : 0
  alarm_name                = "ElastiCache | High CPU Utilization (>${var.high_cpu_threshold}%) | ${var.cache_cluster_id}"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = 5
  datapoints_to_alarm       = 5
  period                    = 300
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/ElastiCache"
  statistic                 = "Average"
  threshold                 = var.high_cpu_threshold
  alarm_description         = "High CPU utilization in ${var.cache_cluster_id}"
  alarm_actions             = concat(var.high_cpu_sns_arns, var.all_alarms_sns_arns)
  ok_actions                = concat(var.high_cpu_sns_arns, var.all_alarms_sns_arns)
  insufficient_data_actions = concat(var.high_cpu_sns_arns, var.all_alarms_sns_arns)
  treat_missing_data        = "breaching"
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
  alarm_name                = "ElastiCache | High Connection Usage (>${var.high_connection_threshold}%) | ${var.cache_cluster_id} | Node ${each.value}"
  alarm_description         = "Average connections node ${each.value} in cluster ${var.cache_cluster_id} is too high"
  comparison_operator       = "LessThanThreshold"
  evaluation_periods        = 5
  datapoints_to_alarm       = 5
  metric_name               = "CurrConnections"
  namespace                 = "AWS/ElastiCache"
  period                    = 300
  statistic                 = "Average"
  threshold                 = (var.high_connection_threshold / 100) * 65000
  alarm_actions             = concat(var.high_connection_sns_arns, var.all_alarms_sns_arns)
  ok_actions                = concat(var.high_connection_sns_arns, var.all_alarms_sns_arns)
  insufficient_data_actions = concat(var.high_connection_sns_arns, var.all_alarms_sns_arns)
  treat_missing_data        = "breaching"
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
  alarm_name                = "ElastiCache | High Memory Usage (>${var.high_memory_threshold}%) | ${var.cache_cluster_id}"
  alarm_description         = "High Memory in ${var.cache_cluster_id}"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = "5"
  metric_name               = "DatabaseMemoryUsagePercentage"
  namespace                 = "AWS/ElastiCache"
  period                    = 60
  statistic                 = "Average"
  threshold                 = var.high_memory_threshold
  alarm_actions             = concat(var.high_memory_sns_arns, var.all_alarms_sns_arns)
  ok_actions                = concat(var.high_memory_sns_arns, var.all_alarms_sns_arns)
  insufficient_data_actions = concat(var.high_memory_sns_arns, var.all_alarms_sns_arns)
  treat_missing_data        = "breaching"

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
  alarm_name                = "ElastiCache | High Engine CPU Utilization (>${var.high_engine_cpu_threshold}%) | ${var.cache_cluster_id}"
  alarm_description         = "High CPU Engine in ${var.cache_cluster_id}"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = 5
  datapoints_to_alarm       = 5
  metric_name               = "EngineCPUUtilization"
  namespace                 = "AWS/ElastiCache"
  period                    = 300
  statistic                 = "Maximum"
  threshold                 = var.high_engine_cpu_threshold
  alarm_actions             = concat(var.high_engine_cpu_sns_arns, var.all_alarms_sns_arns)
  ok_actions                = concat(var.high_engine_cpu_sns_arns, var.all_alarms_sns_arns)
  insufficient_data_actions = concat(var.high_engine_cpu_sns_arns, var.all_alarms_sns_arns)
  treat_missing_data        = "breaching"
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
  alarm_name                = "ElastiCache | High Replication Lag (>${var.high_replication_lag_threshold}) | ${var.cache_cluster_id}"
  alarm_description         = "High Replication lag in ${var.cache_cluster_id}"
  comparison_operator       = "GreaterThanThreshold"
  evaluation_periods        = 5
  datapoints_to_alarm       = 5
  metric_name               = "ReplicationLag"
  namespace                 = "AWS/ElastiCache"
  period                    = 300
  statistic                 = "Maximum"
  threshold                 = var.high_replication_lag_threshold
  alarm_actions             = concat(var.high_replication_lag_sns_arns, var.all_alarms_sns_arns)
  ok_actions                = concat(var.high_replication_lag_sns_arns, var.all_alarms_sns_arns)
  insufficient_data_actions = concat(var.high_replication_lag_sns_arns, var.all_alarms_sns_arns)
  treat_missing_data        = "breaching"
  dimensions = {
    CacheClusterId = var.cache_cluster_id
  }
  tags = merge(var.tags, {
    "CacheClusterId" = var.cache_cluster_id,
    "Terraform"      = "true"
  })
}
