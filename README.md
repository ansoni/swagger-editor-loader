# swagger-editor-loader

This creates an interactive Swagger Editor Webapp that will edit a swagger spec you point it to.

Docker Hub: https://hub.docker.com/r/ansoni/swagger-editor-loader/

# Configuration:

- Container Swagger - /opt/data/swagger.yaml
map using the Docker volume option:  -v your_swagger.yaml:/opt/data/swagger.yaml
- Container Port: 8080
map using the Docker port mapping option: -p 127.0.0.1:8009:8080
 
# Command Line:

	 docker run -d -p 127.0.0.1:8009:8080 -v ${PWD}/your_yaml.yaml:/opt/data/swagger.yaml ansoni/swagger-editor-loader:latest

- Then navigate to http://127.0.0.1:8009  

# Docker Compose:
	version: "2"
	services:
	  swagger_editor:
	  image:  ansoni/swagger-editor-loader:latest
	  ports:
	  - '127.0.0.1:8009:8080'
	  volumes:
	  - ${PWD}/your_swagger.yaml:/opt/data/swagger.yaml  

- docker-compose up -d
- Then navigate to http://127.0.0.1:8009


