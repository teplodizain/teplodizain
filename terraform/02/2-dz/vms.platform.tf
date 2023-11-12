# Задание 2

variable "vm_web_family" {
  type        = string
  default = "ubuntu-2004-lts"

}


# задание 3

variable "vm_web_name1" {
  type        = string
  default = "netology-develop-platform-web"

}

variable "vm_db_name" {
  type        = string
  default = "netology-develop-platform-db"

}

variable "vm_web_platform_id1" {
  type        = string
  default = "standard-v1"

}


variable "vm_db_platform_id2" {
  type        = string
  default = "standard-v1"

}

# Задание 5

variable "env" {
  type        = string
  default = "netology-develop-platform"

}

variable "project_web" {
  type        = string
  default = "web"

}

variable "project_db" {
  type        = string
  default = "db"

}


/*
Input variables:
env = "netology"
project = "develop"
role = "platform"
*/

# netology-develop-platform-web


# Caaaiea 6.1

variable "vm_web_resources" {
  type=map
  default= {
  cpu =2
  ram = 1
  core_fraction = 5
  }
}

variable "vm_db_resources" {
  type=map
  default= {
  cpu =2
  ram = 2
  core_fraction = 20
  }
}

# Caaaiea 6.2

variable "vm_db_metadata" {
  type=map
  default= {
  serial-port-enable = 1   
  }
}