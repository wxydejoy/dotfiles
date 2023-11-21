#!/bin/bash
###
 # @Author: weiekko weiekko@gmail.com
 # @Date: 2023-06-05 14:44:10
 # @LastEditors: weiekko weiekko@gmail.com
 # @LastEditTime: 2023-06-05 14:56:47
 # @FilePath: \dotfiles\install.sh
 # @Description: 
 # 
 # Copyright (c) 2023 by weiekko weiekko@gmail.com, All Rights Reserved. 
### 



# 检查系统是否已安装Git
if ! command -v git &> /dev/null; then
    echo "Git is not installed. Installing Git..."
    # 根据不同系统类型使用不同的安装命令
    if [[ $(uname) == "Darwin" ]]; then
        brew install git
    elif [[ $(uname) == "Linux" ]]; then
        # 使用apt-get安装命令
        sudo apt-get update
        sudo apt-get install -y git
    else
        echo "Unsupported operating system. Please install Git manually."
        exit 1
    fi
fi

# 检查系统是否已安装Zsh
if ! command -v zsh &> /dev/null; then
    echo "Zsh is not installed. Installing Zsh..."
    # 根据不同系统类型使用不同的安装命令
    if [[ $(uname) == "Darwin" ]]; then
        brew install zsh
    elif [[ $(uname) == "Linux" ]]; then
        # 使用apt-get安装命令
        sudo apt-get update
        sudo apt-get install -y zsh
    else
        echo "Unsupported operating system. Please install Zsh manually."
        exit 1
    fi
fi

echo "Git and Zsh are installed."
