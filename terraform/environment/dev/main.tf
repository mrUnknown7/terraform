module "vars" {
    source = "../../modules/vars"
}

module "jenkins_vpc" {
    source = "../../modules/core_vpc"
    vpc_cidr = module.vars.vpc_cidr
    public_subnets_cidr = module.vars.subnet["public_cidr"]
    private_subnets_cidr = module.vars.subnet["private_cidr"]
    az = module.vars.subnet["az"]
    tags = module.vars.common_tags
}