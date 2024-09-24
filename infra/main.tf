provider "docker" {}

resource "docker_image" "backend" {
  name = "flask-backend"
  build {
    context    = "${path.module}/../backend"
    dockerfile = "Dockerfile"
  }
}

resource "docker_image" "frontend" {
  name = "react-frontend"
  build {
    context    = "${path.module}/../frontend"
    dockerfile = "Dockerfile"
  }
}

resource "docker_container" "backend" {
  name  = "flask-backend"
  image = docker_image.backend.latest
  ports {
    internal = 5000
    external = 5000
  }
}

resource "docker_container" "frontend" {
  name  = "react-frontend"
  image = docker_image.frontend.latest
  ports {
    internal = 80
    external = 80
  }
}
