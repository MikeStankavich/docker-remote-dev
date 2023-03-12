# docker-remote-dev
### Automatically set up Docker CE on a cloud VM to enable remote development with Docker and Docker Compose

This project was inspired by https://medium.com/geekculture/seamless-integration-with-remote-docker-hosts-for-development-7a369d94812f

It automates the process of creating a remote VM instance on Amazon EC2, installing docker-ce, 
and setting up your local system to easily access that remote via ssh and docker.

### Prerequisites:
- MacOS or Linux development host
- Docker CLI from Docker Desktop https://www.docker.com/products/docker-desktop/ or docker-ce packaged for your OS
- SSH client
- Terraform - install via homebrew, OS package manager, or downloade from Hashicorp https://developer.hashicorp.com/terraform/downloads
- Ansible - install via homebrew, package manager, or pip
- Just command runner - install via homebrew, package manager, or download from github. More at https://github.com/casey/just

### Installation
- Update terraform.tfvars with your AWS credentials, SSH key details, network details, and instance size preference
- Run `just install` 

### Features under consideration for future releases:
- Support other cloud providers 
- Set up an automated rsync or similar to enable bind mounts to work seamlessly between remote and local
with inotifywait https://www.baeldung.com/linux/monitor-changes-directory-tree

Currently no plans to support windows, but will be glad to review any PRs :)
