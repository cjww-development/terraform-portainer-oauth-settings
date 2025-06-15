terraform {
  required_version = ">=1.12.2"

  required_providers {
    portainer = {
      source = "portainer/portainer"
      version = "1.4.3"
    }
  }
}

variable "portainer_api_key" {
  type        = string
  description = "API key for Portainer"  
}

provider "portainer" {
  endpoint = "http://localhost:9442"
  api_key  = var.portainer_api_key
  skip_ssl_verify  = true # optional (default value is `false`)
}

resource "portainer_settings" "portainer_settings" {
  authentication_method = 3

  oauth_settings {
    access_token_uri = "https://auth.example.com/oauth2/token"
    authorization_uri = "https://auth.example.com/oauth2/authorize"
    client_id = "test"
    client_secret = "test"
    redirect_uri = "https://localhost:9442/"
  }
}