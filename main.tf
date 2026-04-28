# Aquí defino la configuración de mi proyecto y los proveedores que voy a usar
terraform {
  required_version = ">= 1.5" # Me aseguro de usar una versión de Terraform estable
  required_providers {
    aws = {
      source  = "hashicorp/aws" # Especifico que mi proveedor es AWS
      version = "~> 5.0"
    }
  }
}

# Configuro el proveedor de AWS usando la región que definí en mis variables
provider "aws" {
  region = var.region # De esta forma mi despliegue es flexible a cualquier región
}

# Aquí hago el llamado al módulo de S3 que creé para organizar mi código
module "s3_website" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name
  common_tags = var.common_tags # Paso mis etiquetas obligatorias desde mis variables globales
}
