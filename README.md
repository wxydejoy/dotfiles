
My dotfiles.

## 使用前请修改用户名和邮箱 run.sh


## Usage

```bash
sudo bash ./install.sh
```


## Install

Git Zsh

## Toolset


- [oh-my-zsh](http://ohmyz.sh/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [git](https://git-scm.com/)

## Scripts


###  换源
`bash <(curl -sSL https://linuxmirrors.cn/main.sh)`


### ROS
`wget http://fishros.com/install -O fishros && . fishros`


### 一键更新 GitHub Host
`sed -i "/# GitHub520 Host Start/Q" /etc/hosts && curl https://raw.hellogithub.com/hosts >> /etc/hosts`
