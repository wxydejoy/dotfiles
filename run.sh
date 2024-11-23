#!/bin/bash

# /**
#  * @ Author: weiekko
#  * @ Create Time: 2024-04-29 01:03:05
#  * @ Modified by: weiekko
#  * @ Modified time: 2024-04-29 01:03:16
#  * @ Description:
#  */

# 检测是否为管理员运行

EMAIL=weiekko@gmail.com
USERNAME=weiekko
GH=https://hub.gitmirror.com/

# if [ $(id -u) -eq 0 ]; then
#     echo "当前用户是管理员"
# else
#     echo "当前用户不是管理员"
# fi
CURRENT_DIR=`pwd`
ZSH_PLUGINS_DIR="$HOME/.oh-my-zsh/custom/plugins"

# echo $GH

apt() {
  wget https://gitee.com/SuperManito/LinuxMirrors/raw/main/ChangeMirrors.sh && sudo bash ChangeMirrors.sh
}



dotfiles( ) {
  ROS2=$1
  if [ ! -d "$ZSH_PLUGINS_DIR/zsh-autosuggestions" ]; then
    echo "-----> Installing zsh plugin 'zsh-autosuggestions'..."
    # git clone  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone $GH/https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  fi

  if [ ! -d "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting" ]; then
    echo "-----> Installing zsh plugin 'zsh-syntax-highlighting'..."
    # git clone https://gitee.com/asddfdf/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone $GH/https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  fi

  git config --global user.name "$USERNAME"
  git config --global user.email "$EMAIL"

  # 下载dotfiles并配置
  # 备份并替换alias
  cp $HOME/.zshrc $HOME/.zshrc.bak
  cp $CURRENT_DIR/config/aliases $HOME/.zshrc
  wget https://raw.staticdn.net/wxydejoy/dotfiles/master/config/zshrc -O $HOME/.zshrc
  wget https://raw.staticdn.net/wxydejoy/dotfiles/master/config/aliases -O $HOME/.aliases

  # source $HOME/.aliases
  # source $HOME/.zshrc
  if [ $ROS2 ]; then
    echo "-----> Installing ROS2 related commands..."
    #  将ros2相关命令添加到.zshrc
    wget https://raw.staticdn.net/wxydejoy/dotfiles/master/config/ros2 -O $HOME/.ros2
    echo "source $HOME/.ros2" >> $HOME/.zshrc
  fi
  # zshrc
  exec zsh

}



echo "欢迎使用weiekko的系统初始化脚本"
echo "请输入操作对应的数字"
echo "1.apt换源"
echo "2.安装Git zsh"
echo "3.安装oh-my-zsh"
echo "4.配置GitHubHost"
echo "5.配置dotfiles(不包含ROS相关命令)"
echo "6.配置dotfiles(包含ROS相关命令)"


read num

case $num in
    1)
        echo "apt换源"
        apt
        ;;
    2)
        echo "安装Git zsh"
        sudo apt install git zsh -y
        ;;
    3)
        echo "安装oh-my-zsh"
        rm -rf ~/.oh-my-zsh
        sh -c "$(wget -O- https://install.ohmyz.sh/)"
        ;;
    4)
        echo "配置GitHubHost"
        sed -i "/# GitHub520 Host Start/Q" /etc/hosts && curl https://raw.hellogithub.com/hosts >> /etc/hosts
        ;;
    5)
        dotfiles
        ;;
    6)
        dotfiles 1
        ;;
esac