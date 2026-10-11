module "vpc" {
  source = "./modules/vpc"

  vpc_name       = "main-network"
  zone           = var.zone
  v4_cidr_blocks = var.vpc_cidr_blocks
}

module "web_sg" {
  source = "./modules/sg"

  sg_name    = var.web_sg_name
  network_id = module.vpc.vpc_id

  security_group_ingress = var.web_sg_ingress
}

# security_group_egress не указан — используется default (ANY → 0.0.0.0/0)

module "web_vm" {
  source         = "./modules/vm"
  env_name       = var.env_name
  instance_name  = var.web_instance_name
  instance_count = var.web_instance_count
  
  subnet_zones   = [var.zone]
  subnet_ids     = [module.vpc.subnet_id]

  image_family   = var.web_image_family
  public_ip      = var.web_public_ip
  platform       = var.web_platform
  instance_cores = var.web_instance_cores
  instance_memory = var.web_instance_memory
  instance_core_fraction = var.web_instance_core_fraction
  boot_disk_type         = var.web_boot_disk_type
  boot_disk_size         = var.web_boot_disk_size

  security_group_ids = [module.web_sg.sg_id]


  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = var.serial_port_enable
  }

  labels = var.web_labels
  description = var.web_description
  
}



module "mysql_sg" {
  source = "./modules/sg"

  sg_name    = var.mysql_sg_name
  network_id = module.vpc.vpc_id

  security_group_ingress = var.mysql_sg_ingress
 
}


module "mysql" {
  source = "./modules/mysql"

  name               = var.mysql_name
  network_id         = module.vpc.vpc_id
  subnet_id          = module.vpc.subnet_id
  zone               = var.zone
  environment        = var.mysql_environment
  resource_preset_id = var.mysql_resource_preset_id
  disk_type_id       = var.mysql_disk_type_id
  disk_size          = var.mysql_disk_size
  db_password        = var.db_password

  security_group_ids = [module.mysql_sg.sg_id]
}

module "container_registry" {
  source = "./modules/container_registry"

  name = var.registry_name
}


data "template_file" "cloudinit" {
  template = file("./cloud-init.yml")
  vars = {
    username       = var.username
    ssh_public_key = var.ssh_public_key
  }
}

