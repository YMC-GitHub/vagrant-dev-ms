# cnfs

# note-x-s:set cnf to ms 's name and hostname
$VDM_MS_NAME="DEV"
# note-x-e:set cnf to ms 's name and hostname

# note-x-s:set cnf to setup machine on virtualbox
$VDM_PROVIDER="virtualbox"
# note-x-e:set cnf to setup machine on virtualbox

# note-x-s:set cnf to set os type and version
$VDM_BOX_IMAGE="centos/7"
$VDM_BOX_VERSION="1804.02"
# note-x-e:set cnf to set os type and version

# note-x-s:set cnf to set cpus and memory
$VDM_CPUS="2"
$VDM_MEMORY="8192"
# note-x-e:set cnf to set cpus and memory

# note-x-s:set cnf to mout dir cnf
$VDM_MOUT_DIR_VM="/vagrant"
$VDM_MOUT_DIR_PM="."
# note-x-e:set cnf to mout dir cnf

# note-x-s:set cnf to run a shell script to do sth
$VDM_INIT_BASH="sample.sh"
# note-x-e:set cnf to run a shell script to do sth

# note-x-s:set cnf to do sth for other
$VDM_IP="192.168.0.2"
# note-x-e:set cnf to do sth for other

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

  # feat-x-s:cached os box to speed
  if Vagrant.has_plugin?("vagrant-cachier")
    # Configure cached packages to be shared between instances of the same base box.
    config.cache.scope = :box
  end
  # feat-x-e:cached os box to speed
end
