# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'yaml'
box1 = "remram/debian-9-amd64"
box2 = "geerlingguy/centos7"
ram0 = 512
ram1 = 1024
ram2 = 2048
ram3 = 3072
ram4 = 4096
postgre_playbook = "ansible/postgre.yml"
pgpool_playbook = "ansible/pgpool.yml"
keycloak_playbook = "ansible/keycloak.yml"
haproxy_playbook = "ansible/haproxy.yml"
provision1 = "ansible_local"
provision2 = "shell"
provision3 = "salt"
provision4 = "puppet"


VAGRANTFILE_API_VERSION = "2"

# if ENV['USER_PWD'].nil? || ENV['USER_PWD'].empty? and ENV['USER'].nil? || ENV['USER'].empty? and ENV['PROXY'].nil? || ENV['PROXY'].empty? and ENV['PROXY_PORT'].nil? || ENV['PROXY_PORT'].empty? 
#   raise 'Set your windows password in var USER_PWD and USER, eg: USER=your login USER_PWD=your_pwd PROXY=proxy_url PROXY_PORT=proxy_port vagrant up xxx'
# end

node = [
  {:hostname => 'rancher1', :ram =>ram1, :box =>box2, :provision => "shell"},
  {:hostname => 'rancher2', :ram =>ram1, :box =>box2, :provision => "shell"},
  {:hostname => 'rancher3', :ram =>ram1, :box =>box2, :provision => "shell"},
  {:hostname => 'git', :ram =>ram3, :box =>box2, :provision => "shell"},
  {:hostname => 'docker-hub', :ram =>ram1, :box =>box2, :provision => "shell"}
]

Vagrant.configure(2) do |config|

  # if Vagrant.has_plugin?("vagrant-proxyconf")
  #   config.proxy.http       = "http://#{ENV['USER']}:#{ENV['USER_PWD']}@10.49.64.5:8080"
  #   config.proxy.https      = "http://#{ENV['USER']}:#{ENV['USER_PWD']}@10.49.64.5:8080"
  #   config.proxy.no_proxy   = "localhost,127.0.0.1"
  #   config.yum_proxy.http   = "http://#{ENV['USER']}:#{ENV['USER_PWD']}@10.49.64.5:8080"
  #   # config.apt_proxy.http   = "https://#{ENV['USER']}:#{ENV['USER_PWD']}@10.49.64.5:8080"
  #   # config.apt_proxy.https  = "https://#{ENV['USER']}:#{ENV['USER_PWD']}@10.49.64.5:8080"
  # end

  config.vm.network "private_network", type: "dhcp"

  node.each do |n|
    config.vm.define n[:hostname] do |nc|
      nc.vm.box = n[:box];
      nc.vm.hostname = n[:hostname]
      if n[:provision].include? "shell"
        nc.vm.provision "shell", path: "install.sh"
      elsif n[:provision].include? "salt"
        nc.vm.provision :salt do |salt|
          salt.masterless = true
          salt.run_highstate = false
          salt.minion_config = "salt-scripts/minion"          
        end
      elsif n[:provision].include? provision1
        nc.vm.provision :ansible_local do |ansible_local|
          ansible_local.playbook = n[:playbook]
          ansible_local.install = true
          ansible_local.install_mode = :default
          ansible_local.tags = n[:tags]
          ansible_local.groups = n[:groups]
          #ansible_local.inventory_path = n[:inventory]
        end
      elsif n[:provision].include? "ansible"
        nc.ssh.insert_key = true
        nc.vm.provision :ansible do |ansible|
          ansible.playbook = n[:playbook]
          ansible.inventory_path = n[:inventory]
        end
      elsif n[:provision].include? provision4
        nc.vm.provision :puppet do |puppet|
          puppet.manifest_file = "default.pp"
          puppet.manifests_path = "puppet-scripts/manifests/"
        end
      else
        if n[:type].include? "build"
          nc.vm.provision "docker" do |d|
            d.build_image n[:source]
          end
        elsif n[:type].include? "pull"
          nc.vm.provision "docker" do |d|
            d.pull_images [:image]
          end
        else
          nc.vm.provision "docker" do |d|
            d.run [:image]
          end
        end
      end
      memory = n[:ram] ? n[:ram] : 256;
      nc.vm.provider :virtualbox do |ncvb|
        ncvb.customize [
          "modifyvm", :id,
          "--memory", memory.to_s
        ]
      end
    end
  end
end