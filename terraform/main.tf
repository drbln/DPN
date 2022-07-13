terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token     = "AQAAAAAaRO_MAATuwaJlDNVOTE4FozDoj9lxpag"
  cloud_id  = "b1gorgg3rlqkn3e505i2"
  folder_id = "b1gk1kso3ff84q00vek6"
  zone      = "ru-central1-a"
}