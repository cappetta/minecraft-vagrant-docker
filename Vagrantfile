# -*- mode: ruby -*-
# vi: set ft=ruby :

unless Vagrant.has_plugin?("vagrant-docker-compose")
  system("vagrant plugin install vagrant-docker-compose")
  puts "Dependencies installed, please try the command again."
  exit
end

unless Vagrant.has_plugin?("vagrant-gatling-rsync")
  system("vagrant plugin install vagrant-gatling-rsync")
  puts "Rsync Dependency installed, please try the command again."
end

Vagrant.configure("2") do |config|

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--cpus", "2", "--memory", "2048"]
  end

  # config.vm.box = "hashicorp/precise64"
  config.vm.box = "ubuntu/trusty64"
  config.vm.synced_folder './', '/vagrant', type: 'rsync'

  config.vm.network(:forwarded_port, guest: 25565, host: 8080)

  config.vm.provision :shell, inline: "apt-get update"
  config.vm.provision :docker
  config.vm.provision :docker_compose, yml: ["/vagrant/docker-compose.yml"], rebuild: true, project_name: "minecraft", run: "always"
end
