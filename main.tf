terraform {
  cloud {
    organization = "TerraformBeginnerBootcamp-ArmandoDiaz"
    workspaces {
      name = "terra-house-1"
    }
  }

  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
}

provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token = var.terratowns_access_token
}

module "home_arcanum_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.arcanum.public_path
  content_version = var.arcanum.content_version
}

resource "terratowns_home" "home" {
  name = "AI Revolution: Transforming Industries"
  description = <<DESCRIPTION
Explore the dynamic world of artificial intelligence as we delve into its transformative influence on diverse industries. 
From healthcare to finance, manufacturing to education, our blog uncovers the ways AI is reshaping the future. 
Discover the innovations, the impact, and the potential of AI as it revolutionizes and redefines the way we work and live.
DESCRIPTION
  domain_name = module.home_arcanum_hosting.domain_name
  town = "melomaniac-mansion"
  content_version = var.arcanum.content_version
}

module "home_payday_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.payday.public_path
  content_version = var.payday.content_version
}

resource "terratowns_home" "home_payday" {
  name = "Tech Portfolio: Shaping the Digital Future"
  description = <<DESCRIPTION
Welcome to my tech portfolio! Explore my skills, experiences, and projects, showcasing a passion for technology and innovation. 
Join me on this journey through the digital realm as I shape the future, one code at a time.
DESCRIPTION
  domain_name = module.home_payday_hosting.domain_name
  town = "melomaniac-mansion"
  content_version = var.payday.content_version
}