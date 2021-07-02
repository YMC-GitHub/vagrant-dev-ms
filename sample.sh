#echo "ssh config"
#sed -i 's/^#\s\+StrictHostKeyChecking ask/StrictHostKeyChecking no/' /etc/ssh/ssh_config
desc_ns_s="task-x-s:"
echo "${desc_ns_s}set yum base with aliyun"
if [ -z "`sed -n -e '/aliyun.*CentOS-7/p' /etc/yum.repos.d/CentOS-Base.repo`" ]; then
sudo mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak
sudo curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
fi

echo "${desc_ns_s}disable fastmirror plugin"
sudo sed -i 's/enabled=1/enabled=0/' /etc/yum/pluginconf.d/fastestmirror.conf

echo "${desc_ns_s}yum install git"
sudo yum install -y git

echo "${desc_ns_s}yum install vim"
sudo yum install -y vim

echo "${desc_ns_s}yum install gcc and other to compile keepalived"
sudo yum install -y gcc openssl-devel libnl3-devel net-snmp-devel libnfnetlink-devel

echo "${desc_ns_s}disable NetworkManager to fix networkManager and network"
sudo systemctl disable NetworkManager

echo "${desc_ns_s}set timezone to asia/shanghai"
sudo timedatectl set-timezone Asia/Shanghai

echo "${desc_ns_s}restart services relative to time"
sudo systemctl restart rsyslog
sudo systemctl restart crond
