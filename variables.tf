variable "high_cpu_threshold" {
  description = "The threshold for high CPU usage"
  type        = number
  default     = 90

}
variable "high_cpu_enabled" {
  description = "Enable high CPU alarm"
  type        = bool
  default     = true

}
variable "high_cpu_sns_arns" {
  description = "A list of SNS topics ARNs to send notifications to."
  type        = list(string)
  default     = []

}
variable "status_check_failed_enabled" {
  description = "Enable status check failed alarm"
  type        = bool
  default     = true

}
variable "status_check_failed_sns_arns" {
  description = "A list of SNS topics ARNs to send notifications to."
  type        = list(string)
  default     = []

}
variable "high_connection_enabled" {
  description = "Enable high connection alarm"
  type        = bool
  default     = true

}
variable "high_connection_threshold" {
  description = "The threshold for high connection usage"
  type        = number
  default     = 60

}
variable "high_connection_sns_arns" {
  description = "A list of SNS topics ARNs to send notifications to."
  type        = list(string)
  default     = []

}
variable "high_memory_enabled" {
  description = "Enable high memory alarm"
  type        = bool
  default     = true

}
variable "high_memory_threshold" {
  description = "The threshold for high memory usage"
  type        = number
  default     = 90

}
variable "high_memory_sns_arns" {
  description = "A list of SNS topics ARNs to send notifications to."
  type        = list(string)
  default     = []

}
variable "high_engine_cpu_enabled" {
  description = "Enable high engine CPU alarm"
  type        = bool
  default     = true

}
variable "high_engine_cpu_threshold" {
  description = "The threshold for high engine CPU usage"
  type        = number
  default     = 90

}
variable "high_engine_cpu_sns_arns" {
  description = "A list of SNS topics ARNs to send notifications to."
  type        = list(string)
  default     = []

}
variable "cache_cluster_id" {
  description = "The ID of the cache cluster to monitor."
  type        = string

}

variable "all_alarms_sns_arns" {
  description = "A list of SNS topics ARNs to send notifications to."
  type        = list(string)
  default     = []

}
variable "tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}
variable "high_replication_lag_enabled" {
  description = "Enable high replication lag alarm"
  type        = bool
  default     = true

}
variable "high_replication_lag_threshold" {
  description = "The threshold for high replication lag"
  type        = number
  default     = 60

}
variable "high_replication_lag_sns_arns" {
  description = "A list of SNS topics ARNs to send notifications to."
  type        = list(string)
  default     = []

}
