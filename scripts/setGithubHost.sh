sed -i "/# GitHub520 Host Start/Q" /etc/hosts && curl https://raw.hellogithub.com/hosts >> /etc/hosts

# 输出结果
echo "GitHub520 Hosts has been set successfully."

#  sudo apt install network-manager
# sudo service networking restart
