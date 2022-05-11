# syntax=docker/dockerfile:1

# Base image we would like to use for our application.
FROM python:3.8-slim-buster

# This instructs Docker to use this path as the default location for all subsequent commands.
WORKDIR /app

# The COPY command takes two parameters. The first parameter tells Docker what file(s) you would like to copy into the image
COPY requirements.txt requirements.txt

# RUN command in docker
RUN pip3 install -r requirements.txt

# This COPY command takes all the files located in the current directory and copies them into the image. 
COPY . .

# we have to do is to tell Docker what command we want to run
# when our image is executed inside a container. We do this using the CMD command.
# Note that we need to make the application externally visible (i.e. from outside the container) by specifying --host=0.0.0.0.
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
