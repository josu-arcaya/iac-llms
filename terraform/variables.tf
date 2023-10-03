variable "region" {
  description = "Region where the resources will be provisioned"
  default     = "us-west-1"
}

variable "instance_type_elasticsearch" {
  description = "Instance type for Elasticsearch nodes"
  default     = "t2.micro"
}

variable "instance_type_kibana" {
  description = "Instance type for Kibana"
  default     = "t2.micro"
}

variable "instance_type_fastapi" {
  description = "Instance type for FastAPI application"
  default     = "t2.micro"
}

variable "ami" {
  description = "AMI ID for the virtual machines"
  default     = "ami-0f8e81a3da6e2510a" 
}

variable "my_ip" {
  description = "Your public IP address"
  default     = "0.0.0.0/0"
}

variable "ssh_port" {
  description = "Port for SSH access"
  default     = 22
}

variable "http_port" {
  description = "Port for HTTP access"
  default     = 80
}

variable "https_port" {
  description = "Port for HTTPS access"
  default     = 443
}

variable "key_name" {
  description = "Name of the SSH key pair"
  default     = "my-key-pair"
}

