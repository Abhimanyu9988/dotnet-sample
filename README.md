Sample .NET 9 Web Application
This repository contains a simple .NET 9 web application running in a container. We use Renovate to keep our Docker base image (and other dependencies) up to date automatically, and we rely on DockerHub Automated Builds to rebuild and publish the image whenever we merge changes.

Features
Minimal .NET 9 Web API

Provides a basic endpoint that returns a weather forecast or a “Hello World” message.
Set up to listen on port 8080 inside the container.
Pinned Dockerfile

We specify the .NET 9 base images (mcr.microsoft.com/dotnet/sdk:9.0 and mcr.microsoft.com/dotnet/aspnet:9.0) for reproducible builds.
Renovate automatically updates these base images whenever new releases become available.
DockerHub Automated Builds

This repository is linked to DockerHub, so each push (including merges from Renovate) triggers a new build, updating the DockerHub repository with the latest image.
Simple Load Testing

You can stress-test the application by sending repeated requests to curl http://localhost:8080/weatherforecast

or

curl http://localhost:8080/ or your configured endpoint.
