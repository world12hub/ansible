module "vpc" {
  source = "git::https://github.com/world12hub/ter-homeworks.git//diploma/modules/vpc?ref=main"

  vpc_name       = "main-network"
  zone           = var.zone
  v4_cidr_blocks = var.vpc_cidr_blocks
}

module "sg" {
  source = "git::https://github.com/world12hub/ter-homeworks.git//diploma/modules/sg?ref=main"

  sg_name    = var.sg_name
  network_id = module.vpc.vpc_id

  security_group_ingress = var.sg_ingress
}


module "clickhouse" {
  source         = "git::https://github.com/world12hub/ter-homeworks.git//diploma/modules/vm?ref=main"
  env_name       = var.env_name
  instance_name  = var.instance_name
  instance_count = var.instance_count
  
  subnet_zones   = [var.zone]
  subnet_ids     = [module.vpc.subnet_id]

  image_family   = var.image_family
  public_ip      = var.public_ip
  platform       = var.platform
  instance_cores = var.instance_cores
  instance_memory = var.instance_memory
  instance_core_fraction = var.instance_core_fraction
  boot_disk_type         = var.boot_disk_type
  boot_disk_size         = var.boot_disk_size

  security_group_ids = [module.sg.sg_id]


  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = var.serial_port_enable
  }

  labels = var.labels
  description = var.description
  
}

module "vector" {
  source         = "git::https://github.com/world12hub/ter-homeworks.git//diploma/modules/vm?ref=main"
  env_name       = var.env_name
  instance_name  = var.instance_name
  instance_count = var.instance_count
  
  subnet_zones   = [var.zone]
  subnet_ids     = [module.vpc.subnet_id]

  image_family   = var.image_family
  public_ip      = var.public_ip
  platform       = var.platform
  instance_cores = var.instance_cores
  instance_memory = var.instance_memory
  instance_core_fraction = var.instance_core_fraction
  boot_disk_type         = var.boot_disk_type
  boot_disk_size         = var.boot_disk_size

  security_group_ids = [module.sg.sg_id]


  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = var.serial_port_enable
  }

  labels = var.labels
  description = var.description
  
}

module "lighthouse" {
  source         = "git::https://github.com/world12hub/ter-homeworks.git//diploma/modules/vm?ref=main"
  env_name       = var.env_name
  instance_name  = var.instance_name
  instance_count = var.instance_count
  
  subnet_zones   = [var.zone]
  subnet_ids     = [module.vpc.subnet_id]

  image_family   = var.image_family
  public_ip      = var.public_ip
  platform       = var.platform
  instance_cores = var.instance_cores
  instance_memory = var.instance_memory
  instance_core_fraction = var.instance_core_fraction
  boot_disk_type         = var.boot_disk_type
  boot_disk_size         = var.boot_disk_size

  security_group_ids = [module.sg.sg_id]


  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = var.serial_port_enable
  }

  labels = var.labels
  description = var.description
  
}

module "container_registry" {
  source = "git::https://github.com/world12hub/ter-homeworks.git//diploma/modules/container_registry?ref=main"

  name = var.registry_name
}


data "template_file" "cloudinit" {
  template = file("./cloud-init.yml")
  vars = {
    username       = var.username
    ssh_public_key = var.ssh_public_key
  }
}

