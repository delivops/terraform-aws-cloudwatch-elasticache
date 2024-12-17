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
  aws_sns_topics_arns = [aws_sns_topic.sns_topic.arn]
  depends_on        = [aws_sns_topic.sns_topic]
}




