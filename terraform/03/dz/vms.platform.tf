variable "resources" {
  type=map
  default= {
  cpu =2
  ram = 1
  core_fraction = 20
  }
}
  
variable "image_id" {
  type=string
  default= "fd8nru7hnggqhs9mkqps"
}

variable "scheduling_policy" {
  type=bool
  default= true
}

variable "platform_id" {
  type=string
  default= "standard-v3"
}

variable "zone" {
  type=string
  default= "ru-central1-a"
}

# Задание 2.2.


variable "wm_resources" {
  type        = list(object({ vm_name=string, cpu=number, ram=number, disk=number, core_fraction=number}))
  default     = [
    {vm_name="main", 
     cpu=2, 
     ram=2, 
     disk=1
     core_fraction=5
  },
    {vm_name="replica", 
     cpu=2, 
     ram=2, 
     disk=1
     core_fraction=5
  },
    {vm_name="deb", 
     cpu=2, 
     ram=2, 
     disk=1
     core_fraction=5
  },

]
}
