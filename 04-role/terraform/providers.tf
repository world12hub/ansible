terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">=1.15.0"

  backend "s3" {
  # Информация об использованном профиле и зоны доступности
  # shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "default"
  region                   = "ru-central1"
  # Информация о бакете
  bucket  = "tfstate-develop-world12hub" #  название бакета
  key     = "dev1/dev1-terraform.tfstate"
  encrypt = false

  # НОВОЕ: Встроенный механизм блокировок (Terraform >= 1.6)
  # Не требует отдельной базы данных (DynamoDB/YDB)!
  use_lockfile = true
  # Настройки yandex cloud
  skip_credentials_validation = true
  skip_region_validation      = true
  skip_requesting_account_id  = true
  skip_s3_checksum            = true
    
    endpoints = {
      s3 = "https://storage.yandexcloud.net"
    }
  } 
}

provider "yandex" {
  # token                    = "do not use!!!"
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  service_account_key_file = file("~/.authorized_key.json")
  zone                     = var.zone
}
