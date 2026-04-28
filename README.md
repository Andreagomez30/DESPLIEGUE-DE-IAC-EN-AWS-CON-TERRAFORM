# Despliegue de Infraestructura como Código (IaC) - AWS & Terraform

3 Este proyecto consiste en el despliegue de una infraestructura automatizada en AWS utilizando **Terraform**. El objetivo principal es
      hospedar una página web estática en un bucket de **Amazon S3**, siguiendo las mejores prácticas de Infraestructura como Código (IaC),
      modularización y seguridad.
    4
    5 **Estudiante:** Yennifer Gomez
    6 **Proyecto:** Despliegue de página web estática en S3
    7 **Institución:** BeTek
    8
    9 ---
   10
   11 ## 🚀 Descripción del Proyecto
   12
   13 He diseñado esta solución utilizando una arquitectura modular para asegurar que el código sea escalable y fácil de mantener. El proyecto
      realiza las siguientes acciones:
   14
   15 1.  **Configuración del Provider:** Conexión segura con AWS usando variables para la región.
   16 2.  **Creación de Bucket S3:** Creación de un bucket con nombre dinámico y configuración para Hosting Estático.
   17 3.  **Seguridad y Acceso:** Configuración de políticas de bucket y eliminación de bloqueos públicos para permitir el acceso web.
   18 4.  **Carga de Contenido:** Subida automática del archivo `index.html`.
   19 5.  **Etiquetado (Tags):** Implementación de tags obligatorios (`Environment`, `Owner`, `Project`) en todos los recursos.
   20
   21 ---
   22
   23 ## 📂 Estructura del Proyecto
  .
  ├── main.tf            # Configuración principal y llamado al módulo
  ├── variables.tf       # Definición de variables globales
  ├── terraform.tfvars   # Valores de las variables (Nombres, Tags, Región)
  ├── outputs.tf         # Definición de salidas (URL del sitio)
  ├── index.html         # Archivo web a desplegar
  ├── .gitignore         # Archivos excluidos de Git
  └── modules/
      └── s3/
    1
    2 ---
    3
    4 ## 🛠️ Instrucciones de Despliegue
    5
    6 Para replicar este despliegue, sigue estos pasos:
    7
    8 ### 1. Requisitos Previos
    9 *   Tener instalado **Terraform** (v1.5+).
   10 *   Tener configuradas tus credenciales de **AWS CLI** con los permisos necesarios.
   11
   12 ### 2. Inicialización
   13 Primero, inicializa el directorio para descargar los proveedores de AWS:
  terraform init

   1
   2 ### 3. Validación y Formato
   3 Asegúrate de que el código esté correctamente escrito y formateado:
  terraform fmt -recursive
  terraform validate

   1
   2 ### 4. Ejecución del Plan
   3 Verifica los recursos que se van a crear:
  terraform plan

   1
   2 ### 5. Aplicar el Despliegue
   3 Crea la infraestructura en tu cuenta de AWS:
  terraform apply -auto-approve

    1
    2 ---
    3
    4 ## 🌐 Resultados
    5
    6 Al finalizar el despliegue, Terraform mostrará un `output` con la URL pública de la página web.
    7
    8 **Ejemplo de URL:**
    9 `http://examen-terraform-yenniferg.s3-website-us-east-1.amazonaws.com`
   10
   11 ---
   12
   13 ## 🧹 Limpieza
   14
   15 Para eliminar todos los recursos creados y evitar cargos en la cuenta de AWS, ejecuta:
  terraform destroy -auto-approve
   1
