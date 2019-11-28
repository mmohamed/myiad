# Goal
- Create a devloppement environment for Symfony using Vagrant & Ansible.
- Using Symfony demo application with Nginx to check environement.
- Create phpunit and code siniffer entry point.

# Requirement
Vagrant installed.
Virtualisation provider (for my project **virtualbox**).
Maker installed.

# Steps
##### Get project
`git clone https://github.com/mmohamed/myiad.git myiad`

##### Get App source
`cd myiad/src && git clone https://github.com/symfony/demo.git app`

##### Install Vagrant[ host manager](https://github.com/devopsgroup-io/vagrant-hostmanager " host manager") plugin (required for Win Host)
`vagrant plugin install vagrant-hostmanager`

##### Run :
`vagrant up myiad`

*Nginx with be installed on machine starting for port binding, can be installed by ansible playbook.*

##### Get SSH parameters (for private key file path):
`vagrant ssh-config myiad`

##### Run Ansible deployment (in project directory):
`ansible-playbook playbook.yaml -i inventory -e ansible_ssh_private_key_file=.vagrant/machines/myiad/[virtualbox]/private_key`

 *"virtualbox" must be changed by used provider, on this step all requirements packages with be installed (php-*), composer for vendors and utility, and Nginx configuration setting.*

##### Open browser :
`http://symfony-demo.local`

##### Testing and code quality :
`make test`
`make cs`

# End