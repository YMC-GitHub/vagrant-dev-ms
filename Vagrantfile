# cnfs
$VDM_MS_NAME="DEV"
$VDM_BOX_IMAGE="centos/7"
$VDM_BOX_VERSION="1804.02"
$VDM_PROVIDER="virtualbox"
$VDM_IP="192.168.0.2"
$VDM_MOUT_DIR_VM="/vagrant"
$VDM_MOUT_DIR_PM="."
$VDM_CPUS="1"
$VDM_MEMORY="8192"
$VDM_INIT_BASH="sample.sh"

# sams
Vagrant.configure(2) do |config|
  config.vm.provider $VDM_PROVIDER do |vb|
    vb.customize [ "guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 1000 ]
  end

  config.vm.define $VDM_MS_NAME do |dev|
    dev.vm.box = $VDM_BOX_IMAGE
    dev.vm.box_version = $VDM_BOX_VERSION
    dev.vm.box_check_update = false

    dev.vm.hostname = $VDM_MS_NAME

    #dev.vm.network "private_network", ip: $VDM_IP
    dev.vm.network :private_network, type: "dhcp"

    dev.vm.provider $VDM_PROVIDER do |vb|
        vb.memory = $VDM_MEMORY
        vb.cpus = $VDM_CPUS
        vb.name = $VDM_MS_NAME
    end

    # mount current dir to some path
    dev.vm.synced_folder $VDM_MOUT_DIR_PM, $VDM_MOUT_DIR_VM, type: $VDM_PROVIDER

    # use shell scripts to install and config
    dev.vm.provision "shell", path: $VDM_INIT_BASH
  end

  # ssh config for vagrant
  #config.ssh.username = "vagrant"
  #config.ssh.private_key_path = "~/.vagrant.d/insecure_private_key"
  #config.ssh.insert_key = false

  if Vagrant.has_plugin?("vagrant-cachier")
    # Configure cached packages to be shared between instances of the same base box.
    config.cache.scope = :box
  end
end