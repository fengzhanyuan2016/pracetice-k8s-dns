Vagrant.configure("2") do |config|
  (1..3).each do |i|
      config.vm.define "node#{i}" do |node|
      # 设置虚拟机的Box
      node.vm.box = "ubuntu/xenial64"
      # 设置虚拟机的主机名
      node.vm.hostname="node#{i}"
      # 设置虚拟机的硬盘
      node.disksize.size = '30GB'
      # 设置虚拟机的IP
      node.vm.network "private_network", ip: "192.168.33.#{i+100}"
      # 设置主机与虚拟机的共享目录
      node.vm.synced_folder "./share", "/home/vagrant/share"
      # VirtaulBox相关配置
      node.vm.provider "virtualbox" do |v|
          # 设置虚拟机的名称
          v.name = "node#{i}"
          # 设置虚拟机的内存大小  
          v.memory = 2048
          # 设置虚拟机的CPU个数
          v.cpus = 2
      end
      # 使用shell脚本进行软件安装和配置
      node.vm.provision "shell", inline: <<-SHELL
          # 安装docker
          curl -fsSL https://get.docker.com -o get-docker.sh
          sudo sh get-docker.sh
          usermod -aG docker vagrant
          cat share/id_rsa.pub >> .ssh/authorized_keys
          
      SHELL

      end
  end
end