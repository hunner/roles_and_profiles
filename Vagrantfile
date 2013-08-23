Vagrant.configure('2') do |config|
  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"

  config.vm.hostname = 'wordpress.example.com'
  config.vm.network :forwarded_port, guest: 80, host: 8080
  config.vm.provision :shell, :inline => 'apt-get update'
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file  = "site.pp"
    puppet.module_path    = "modules"
  end
  config.vm.provision :shell, :inline => 'echo Visit http://localhost:8080/blog to configure wordpress'

end
