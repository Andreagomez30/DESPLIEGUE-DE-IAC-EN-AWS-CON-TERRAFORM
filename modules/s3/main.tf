# Primero creo mi bucket de S3 usando el nombre dinámico de mi variable
resource "aws_s3_bucket" "web_bucket" {
  bucket = var.bucket_name
  tags   = var.common_tags # Le aplico mis tags para cumplir con los requisitos del examen
}

# Configuro el bucket para que funcione específicamente como un sitio web estático
resource "aws_s3_bucket_website_configuration" "web_config" {
  bucket = aws_s3_bucket.web_bucket.id
  index_document {
    suffix = "index.html" # Indico que este será mi archivo de inicio
  }
}

# Desactivo el bloqueo de acceso público que AWS pone por defecto
# Necesito hacer esto para que mi página sea accesible desde el navegador
resource "aws_s3_bucket_public_access_block" "public_block" {
  bucket                  = aws_s3_bucket.web_bucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Creo la política del bucket para dar permisos de lectura a todo el mundo
resource "aws_s3_bucket_policy" "public_policy" {
  bucket = aws_s3_bucket.web_bucket.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Sid       = "PublicReadGetObject"
      Effect    = "Allow"
      Principal = "*"
      Action    = "s3:GetObject"
      Resource  = "${aws_s3_bucket.web_bucket.arn}/*" # Doy acceso a todos los archivos del bucket
    }]
  })
  # Me aseguro de que el bloqueo público se haya quitado antes de aplicar esta política
  depends_on = [aws_s3_bucket_public_access_block.public_block]
}

# Finalmente, subo mi archivo index.html al bucket
resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.web_bucket.id
  key          = "index.html"
  source       = "index.html" # Tomo mi archivo local
  content_type = "text/html"  # Le digo a AWS que es un HTML para que se vea bien en la web
  tags         = var.common_tags
}
