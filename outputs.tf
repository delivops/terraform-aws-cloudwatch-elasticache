output "high_cpu_alarm_arn" {
  description = "ARN of the high CPU utilization alarm (empty string when disabled)."
  value       = length(aws_cloudwatch_metric_alarm.high_cpu) > 0 ? aws_cloudwatch_metric_alarm.high_cpu[0].arn : ""
}

output "high_connection_alarm_arns" {
  description = "Map of cache node ID to ARN of the high connection usage alarm (empty map when disabled)."
  value       = { for node_id, alarm in aws_cloudwatch_metric_alarm.high_connection : node_id => alarm.arn }
}

output "high_memory_alarm_arn" {
  description = "ARN of the high memory usage alarm (empty string when disabled)."
  value       = length(aws_cloudwatch_metric_alarm.high_memory) > 0 ? aws_cloudwatch_metric_alarm.high_memory[0].arn : ""
}

output "high_engine_cpu_alarm_arn" {
  description = "ARN of the high engine CPU utilization alarm (empty string when disabled)."
  value       = length(aws_cloudwatch_metric_alarm.high_engine_cpu) > 0 ? aws_cloudwatch_metric_alarm.high_engine_cpu[0].arn : ""
}

output "high_replication_lag_alarm_arn" {
  description = "ARN of the high replication lag alarm (empty string when disabled)."
  value       = length(aws_cloudwatch_metric_alarm.high_replication_lag) > 0 ? aws_cloudwatch_metric_alarm.high_replication_lag[0].arn : ""
}
