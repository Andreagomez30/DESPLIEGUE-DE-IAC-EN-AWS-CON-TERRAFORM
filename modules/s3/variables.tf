variable "bucket_name" {
  description = "Nombre del bucket S3"
  type        = string
}

variable "common_tags" {
  description = "Tags para los recursos"
  type        = map(string)
}
