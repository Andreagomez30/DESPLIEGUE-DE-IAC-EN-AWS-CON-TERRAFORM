output "s3_bucket_website_url" {
  description = "La URL para acceder a la página web desplegada"
  value       = module.s3_website.website_url
}
