module "vars" {
    source = "../../modules/vars/dev"
}

module "jenkins_vpc" {
    source = "../../modules/core_vpc/dev"
    vpc_cidr = module.vars.vpc_cidr
    public_subnets_cidr = module.vars.subnet["public_cidr"]
    private_subnets_cidr = module.vars.subnet["private_cidr"]
    az = module.vars.subnet["az"]
    tags = module.vars.common_tags
}