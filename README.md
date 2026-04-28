 Despliegue de IaC en AWS con Terraform 🚀

Este proyecto automatiza el despliegue de una infraestructura en **Amazon Web Services (AWS)** utilizando **Terraform**. El objetivo principal es hospedar una página web estática en un bucket de **Amazon S3**, aplicando mejores prácticas de modularización, seguridad y etiquetado.

## 👤 Información del Estudiante
* **Nombre:** Yennifer Gomez
* **Proyecto:** Despliegue de página web estática en S3
* **Institución:** BeTek

---

## 🛠️ Descripción de la Solución

La arquitectura se diseñó de forma modular para garantizar escalabilidad. Las acciones principales incluyen:

1.  **Configuración del Provider:** Conexión segura con AWS parametrizada por región.
2.  **Creación de Bucket S3:** Uso de nombres dinámicos y configuración de `website host`.
3.  **Seguridad:** Implementación de políticas de acceso (Bucket Policy) y gestión de `Public Access Block`.
4.  **Automatización de Contenido:** Carga automática del archivo `index.html`.
5.  **Gobierno:** Implementación de etiquetas obligatorias (`Environment`, `Owner`, `Project`).

---

## 📂 Estructura del Proyecto

```text
.
├── main.tf            # Configuración principal y llamado al módulo
├── variables.tf       # Definición de variables globales
├── terraform.tfvars   # Valores de las variables (Nombres, Tags, Región)
├── outputs.tf         # Definición de salidas (URL del sitio)
├── index.html         # Archivo web a desplegar
├── .gitignore         # Archivos excluidos de Git
└── modules/
    └── s3/
        ├── main.tf    # Recursos específicos de S3
        ├── variables.tf
        └── outputs.tf
