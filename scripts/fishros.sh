mkdir -p /tmp/fishinstall/tools/translation/assets
wget http://mirror.fishros.com/install/install.py -O /tmp/fishinstall/install.py 2>>/dev/null 
source /etc/profile
if [ $UID -eq 0 ];then
    apt-get install sudo 
fi
sudo apt install python3-distro python3-yaml -y
sudo python3 /tmp/fishinstall/install.py
# sudo rm -rf /tmp/fishinstall/
# sudo rm fishros
. ~/.zshrc 2>/dev/null
. ~/.bashrc