output "website_url" {
  description = "URL del sitio web estático"
  value       = aws_s3_bucket_website_configuration.web_config.website_endpoint
}
