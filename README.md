![image info](logo.jpeg)

# terraform-aws-cloudwatch-elasticache

This Terraform module configures multiple CloudWatch alarms for monitoring ElastiCache clusters, specifically targeting high CPU utilization, high connection count, high memory usage, high engine CPU usage, and high replication lag.

Each alarm triggers an alert to a specified SNS topic when a threshold is breached, enabling real-time notifications for critical issues.

## Installation

To use this module, you need to have Terraform installed. You can find installation instructions on the Terraform website.

## Usage

The module will create cloudwatch alarms for your EC2. You can use this module multiple times to create alarms with different configurations for various instances or metrics.

```python


################################################################################
# Cloudwatch Alarms for Elasticache
################################################################################

provider "aws" {
  region = "eu-west-1"
}

resource "aws_sns_topic" "sns_topic" {
  name         = "sns"
  display_name = "sns"
}

resource "aws_sns_topic_subscription" "sns_subscription" {
  confirmation_timeout_in_minutes = 1
  endpoint_auto_confirms          = false
  topic_arn                       = aws_sns_topic.sns_topic.arn
  protocol                        = "https"
  endpoint                        = "https://api.sns.com/v1/xxx"
  depends_on                      = [aws_sns_topic.sns_topic]
}

module "elasticache-alarms" {
  source = "delivops/cloudwatch-elasticache/aws"
  #version            = "0.0.1"

  cache_cluster_id  = var.cache_cluster_id
  all_alarms_sns_arns = aws_sns_topic.sns_topic.arn
  depends_on        = [aws_sns_topic.sns_topic]
}


```

## information

This module includes the following types of alerts:

High CPU Utilization: Triggers when CPU usage exceeds the defined threshold.

High Connection Count: Triggers when connection count reaches high levels.

High Memory Usage: Triggers when memory usage exceeds the defined threshold.

High Engine CPU Usage: Triggers when engine CPU usage is too high.

High Replication Lag: Triggers when replication lag exceeds the defined threshold.

## Responding to Alerts

When an alert is triggered, check your SNS topic for a notification. Here are suggested actions for each alert type:

High CPU Utilization: Consider scaling your cluster or optimizing your workload.

High Connection Count: Investigate connection patterns and consider increasing the connection limit or implementing connection pooling.

High Memory Usage: Review memory usage patterns, consider optimizing the cache, or increasing memory capacity.

High Engine CPU Usage: Look into query performance and optimize heavy queries or spread load across multiple nodes.

High Replication Lag: Check the replication status and network health. You may need to increase the replication instance size or troubleshoot network bottlenecks.

<!-- BEGIN_TF_DOCS -->

## Requirements

| Name                                                   | Version   |
| ------------------------------------------------------ | --------- |
| <a name="requirement_aws"></a> [aws](#requirement_aws) | >= 4.67.0 |

## Providers

| Name                                             | Version   |
| ------------------------------------------------ | --------- |
| <a name="provider_aws"></a> [aws](#provider_aws) | >= 4.67.0 |

## Modules

No modules.

## Resources

| Name                                                                                                                                                    | Type        |
| ------------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [aws_cloudwatch_metric_alarm.high_connection](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm)      | resource    |
| [aws_cloudwatch_metric_alarm.high_cpu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm)             | resource    |
| [aws_cloudwatch_metric_alarm.high_engine_cpu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm)      | resource    |
| [aws_cloudwatch_metric_alarm.high_memory](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm)          | resource    |
| [aws_cloudwatch_metric_alarm.high_replication_lag](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource    |
| [aws_elasticache_cluster.elasticache_cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/elasticache_cluster)       | data source |

## Inputs

<<<<<<< Updated upstream
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_sns_topic_arn"></a> [aws_sns_topic_arn](#input_aws_sns_topic_arn) | The ARN of the SNS topic to send CloudWatch alarms to. | `string` | n/a | yes |
| <a name="input_cache_cluster_id"></a> [cache_cluster_id](#input_cache_cluster_id) | The ID of the cache cluster to monitor. | `string` | n/a | yes |
| <a name="input_high_connection_enabled"></a> [high_connection_enabled](#input_high_connection_enabled) | Enable high connection alarm | `bool` | `true` | no |
| <a name="input_high_connection_threshold"></a> [high_connection_threshold](#input_high_connection_threshold) | The threshold for high connection usage | `number` | `60` | no |
| <a name="input_high_cpu_enabled"></a> [high_cpu_enabled](#input_high_cpu_enabled) | Enable high CPU alarm | `bool` | `true` | no |
| <a name="input_high_cpu_threshold"></a> [high_cpu_threshold](#input_high_cpu_threshold) | The threshold for high CPU usage | `number` | `90` | no |
| <a name="input_high_engine_cpu_enabled"></a> [high_engine_cpu_enabled](#input_high_engine_cpu_enabled) | Enable high engine CPU alarm | `bool` | `true` | no |
| <a name="input_high_engine_cpu_threshold"></a> [high_engine_cpu_threshold](#input_high_engine_cpu_threshold) | The threshold for high engine CPU usage | `number` | `90` | no |
| <a name="input_high_memory_enabled"></a> [high_memory_enabled](#input_high_memory_enabled) | Enable high memory alarm | `bool` | `true` | no |
| <a name="input_high_memory_threshold"></a> [high_memory_threshold](#input_high_memory_threshold) | The threshold for high memory usage | `number` | `90` | no |
| <a name="input_high_replication_lag_enabled"></a> [high_replication_lag_enabled](#input_high_replication_lag_enabled) | Enable high replication lag alarm | `bool` | `true` | no |
| <a name="input_high_replication_lag_threshold"></a> [high_replication_lag_threshold](#input_high_replication_lag_threshold) | The threshold for high replication lag | `number` | `60` | no |
| <a name="input_status_check_failed_enabled"></a> [status_check_failed_enabled](#input_status_check_failed_enabled) | Enable status check failed alarm | `bool` | `true` | no |
| <a name="input_tags"></a> [tags](#input_tags) | A map of tags to add to all resources. | `map(string)` | `{}` | no |
=======
| Name | Description | Type | Default | Required |
| --------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------ | ------------- | ------- | :------: |
| <a name="input_aws_sns_topic_arn"></a> [aws_sns_topic_arn](#input_aws_sns_topic_arn) | The ARN of the SNS topic to send CloudWatch alarms to. | `string` | n/a | yes |
| <a name="input_cache_cluster_id"></a> [cache_cluster_id](#input_cache_cluster_id) | The ID of the cache cluster to monitor. | `string` | n/a | yes |
| <a name="input_high_connection_enabled"></a> [high_connection_enabled](#input_high_connection_enabled) | Enable high connection alarm | `bool` | `true` | no |
| <a name="input_high_connection_threshold"></a> [high_connection_threshold](#input_high_connection_threshold) | The threshold for high connection usage | `number` | `90` | no |
| <a name="input_high_cpu_enabled"></a> [high_cpu_enabled](#input_high_cpu_enabled) | Enable high CPU alarm | `bool` | `true` | no |
| <a name="input_high_cpu_threshold"></a> [high_cpu_threshold](#input_high_cpu_threshold) | The threshold for high CPU usage | `number` | `90` | no |
| <a name="input_high_engine_cpu_enabled"></a> [high_engine_cpu_enabled](#input_high_engine_cpu_enabled) | Enable high engine CPU alarm | `bool` | `true` | no |
| <a name="input_high_engine_cpu_threshold"></a> [high_engine_cpu_threshold](#input_high_engine_cpu_threshold) | The threshold for high engine CPU usage | `number` | `90` | no |
| <a name="input_high_memory_enabled"></a> [high_memory_enabled](#input_high_memory_enabled) | Enable high memory alarm | `bool` | `true` | no |
| <a name="input_high_memory_threshold"></a> [high_memory_threshold](#input_high_memory_threshold) | The threshold for high memory usage | `number` | `90` | no |
| <a name="input_high_replication_lag_enabled"></a> [high_replication_lag_enabled](#input_high_replication_lag_enabled) | Enable high replication lag alarm | `bool` | `true` | no |
| <a name="input_high_replication_lag_threshold"></a> [high_replication_lag_threshold](#input_high_replication_lag_threshold) | The threshold for high replication lag | `number` | `60` | no |
| <a name="input_status_check_failed_enabled"></a> [status_check_failed_enabled](#input_status_check_failed_enabled) | Enable status check failed alarm | `bool` | `true` | no |
| <a name="input_tags"></a> [tags](#input_tags) | A map of tags to add to all resources. | `map(string)` | `{}` | no |

> > > > > > > Stashed changes

## Outputs

No outputs.

<!-- END_TF_DOCS -->
