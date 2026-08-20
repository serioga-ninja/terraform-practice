variable "instance_type" {
  description = "Type of EC2 instance to provision"
  default     = "t3.nano"
}

variable "ami_filter" {
  description = "Filter for the AMI to use for the EC2 instance"
  type = object({
    name   = string
    owners = list(string)
  })

  default = {
    name   = "al2023-ami-2023.*-x86_64"
    owners = ["amazon"] # Amazon Linux 2023 (Bitnami community AMIs were discontinued)
  }

}

variable "environment" {
  description = "Environment name"
  type = object({
    name = string
    network_prefix = string
  })
  default = {
    name            = "dev"
    network_prefix  = "10.0"
  }
}

variable "min_size" {
  description = "Minimum number of instances in the Auto Scaling group"
  default     = 1
}

variable "max_size" {
  description = "Maximum number of instances in the Auto Scaling group"
  default     = 2
}
