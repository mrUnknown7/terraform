output "common_tags" {
    value = {
        environment = "prod"
        project = "jenkins"
    }
}

output "vpc_cidr" {
    value = "30.0.0.0/26"
}

output "subnet" {
    value = {
        public_cidr = ["30.0.0.0/28", "30.0.0.32/28"]
        private_cidr = ["30.0.0.16/28", "30.0.0.48/28"]
        az = ["ap-south-1a", "ap-south-1b"]
    }
}