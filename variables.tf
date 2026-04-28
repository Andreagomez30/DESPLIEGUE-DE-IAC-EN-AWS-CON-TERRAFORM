# Defino mi región de AWS para que el despliegue sea dinámico
variable "region" {
  description = "La zona geográfica donde voy a crear mis recursos"
  type        = string
}

# Variable para el nombre de mi bucket, así cumplo con el requisito de nombre dinámico
variable "bucket_name" {
  description = "El nombre único que le voy a poner a mi contenedor S3"
  type        = string
}

# Mi mapa de etiquetas obligatorias para cumplir con los estándares de administración
variable "common_tags" {
  description = "Etiquetas que identifican mi entorno, mi nombre y el proyecto"
  type        = map(string)
}
