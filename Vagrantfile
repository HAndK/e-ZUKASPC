Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/" +
    "trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.provider :virtualbox do |vb|
    vb.customize [ 'modifyvm', :id, '--memory', 800 ]
    vb.customize [ 'modifyvm', :id, '--natdnsproxy1', 'off']
    vb.customize [ 'modifyvm', :id, '--natdnshostresolver1', 'off']
  end
  
  config.vm.network "forwarded_port", guest: 3000, host: 4003

  config.vm.provision :shell, inline: "apt-get update"
  config.vm.provision :shell, inline: "apt-get -y upgrade"
  config.vm.provision :shell, inline: "apt-get -y install build-essential"

  config.vm.provision :shell, path: "provision/chruby.sh"
  config.vm.provision :shell, path: "provision/ruby-install.sh"
  config.vm.provision :shell, path: "provision/ruby.sh"
  config.vm.provision :shell, path: "provision/rails.sh", privileged: false
  config.vm.provision :shell, path: "provision/mysql-server.sh"
  config.vm.provision :shell, path: "provision/postgresql-server.sh"
  config.vm.provision :shell, path: "provision/lib.sh"
  config.vm.provision :shell, path: "provision/config.sh"
  config.vm.provision :shell, path: "provision/git.sh"

 if Vagrant.has_plugin?("vagrant-proxyconf") 
    https_proxy = ENV['https_proxy'].to_s
    https_proxy_user = ENV['https_proxy_user'].to_s
    https_proxy_pass = ENV['https_proxy_pass'].to_s

    unless https_proxy.empty? 
      url = https_proxy.split('//').join("//#{https_proxy_user}:#{https_proxy_pass}@").chomp("/") + '/'
      config.proxy.http = url
      config.proxy.https = url
    end
  end
end
