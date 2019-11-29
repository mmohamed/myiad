# Goal
- Create a development environment for Symfony using Vagrant & Ansible.
- Using Symfony demo application with Nginx to check environment.
- Create phpunit and codesniffer entry point.

# Requirement
Vagrant must be installed.

Virtualisation provider available (**virtualbox** in this case).

Maker must be installed.

Supported OS and Arch by Vagrant

# Steps
##### Get project
`git clone https://github.com/mmohamed/myiad.git myiad`

##### Get source (Fixed release for Security checker)
`cd myiad/src && git clone --branch v1.1.1 https://github.com/symfony/demo.git app`

##### Install Vagrant[ host manager](https://github.com/devopsgroup-io/vagrant-hostmanager " host manager") plugin (required for Win Host)
`vagrant plugin install vagrant-hostmanager`

##### Run :
`vagrant up myiad`

*Nginx can be installed at machine starting with bootstrap file, or will be installed by ansible playbook.*

##### Get SSH parameters (for private key file path):
`vagrant ssh-config myiad`

##### Run Ansible deployment (in project directory):
`ansible-playbook playbook.yaml -i inventory -e ansible_ssh_private_key_file=[.vagrant/machines/myiad/virtualbox/private_key]`

 *"Private key file path" must be replaced by your path (check SSH parameters output). On this step all requirements packages will be installed (nginx, php-*, ...), composer for vendors, code sniffer for quality and Nginx and Postgresql configuration setting (with development environment configuration for Symfony).*

##### Install DB :
`make install`

##### Open browser :
`http://symfony-demo.local`

##### Testing and code quality :
`make test`

`make cs`

# End