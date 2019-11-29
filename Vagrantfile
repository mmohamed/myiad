Vagrant.configure("2") do |config|

  # Vm
  config.vm.box = "hashicorp/bionic64"
  config.vm.synced_folder "./src/app", "/var/www/app"
  # Provision
  #config.vm.provision :shell, path: "bootstrap.sh"
  # Network
  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.hostmanager.manage_guest = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = true
  config.vm.define 'myiad' do |node|
    node.vm.network "forwarded_port", guest: 80, host: 80, id: "nginx"
    node.hostmanager.aliases = %w(symfony-demo.local)
  end

end