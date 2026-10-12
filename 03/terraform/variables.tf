variable "cloud_id" {
  type        = string
  description = "ID облака Yandex Cloud"
}

variable "folder_id" {
  type        = string
  description = "ID каталога Yandex Cloud"
}

variable "zone" {
  type        = string
  default     = "ru-central1-a"
  description = "Зона доступности"

  validation {
    condition = contains([
      "ru-central1-a",
      "ru-central1-b",
      "ru-central1-d",
      "ru-central1-e",
    ], var.zone)
    error_message = "Зона должна быть одной из: ru-central1-a, ru-central1-b, ru-central1-d, ru-central1-e."
  }
}


variable "username" {
  type        = string
  description = "Имя пользователя в ВМ"
  default     = "ubuntu"
}


variable "ssh_public_key" {
  type    = string
  description = "ssh public key"

  validation {
    condition     = var.ssh_public_key == null || can(regex("^ssh-(rsa|ed25519|dss) ", var.ssh_public_key))
    error_message = "ssh_public_key должен быть null или валидным SSH-ключом (ssh-rsa / ssh-ed25519 / ssh-dss)."
  }  
}

variable "vpc_name" {
  type    = string
  default = "main-network"
}

variable "vpc_cidr_blocks" {
  type    = list(string)
  default = ["10.0.1.0/24"]
}

variable "sg_name" {
  type    = string
  default = "vm_sg"
}

variable "sg_ingress" {
  type = list(object({
    protocol       = string
    description    = string
    v4_cidr_blocks = list(string)
    port           = number
  }))
  default = [
    {
      protocol       = "TCP"
      description    = "SSH"
      v4_cidr_blocks = ["0.0.0.0/0"]
      port           = 22
    },
    {
      protocol       = "TCP"
      description    = "HTTP"
      v4_cidr_blocks = ["0.0.0.0/0"]
      port           = 80
    },
    {
      protocol       = "TCP"
      description    = "HTTPS"
      v4_cidr_blocks = ["0.0.0.0/0"]
      port           = 443
    },
  ]
}

variable "env_name" {
  type    = string
  default = "dev"
}

variable "instance_name_clickhouse" {
  type    = string
  default = "clickhouse"
}

variable "instance_name_vector" {
  type    = string
  default = "vector"
}

variable "instance_name_lighthouse" {
  type    = string
  default = "lighthouse"
}

variable "instance_count" {
  type    = number
  default = 1
}

variable "image_family" {
  type    = string
  default = "ubuntu-2004-lts"
}

variable "public_ip" {
  type    = bool
  default = true
}

variable "platform" {
  type    = string
  default = "standard-v3"
}

variable "instance_cores" {
  type    = number
  default = 2
}

variable "instance_memory" {
  type    = number
  default = 2
}

variable "instance_core_fraction" {
  type    = number
  default = 20
}

variable "boot_disk_type" {
  type    = string
  default = "network-hdd"
}

variable "boot_disk_type_clickhouse" {
  type    = string
  default = "network-ssd"
}

variable "boot_disk_size" {
  type    = number
  default = 10
}

variable "serial_port_enable" {
  type    = string
  default = "0"
}

variable "labels" {
  type = map(string)
  default = {
    owner   = "s-kanyugin"
    project = "devops"
  }
}

variable "description" {
  type    = string
  default = "VM for learning project"
}

variable "registry_name" {
  type    = string
  default = "app-registry"
}