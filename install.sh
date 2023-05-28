#!/bin/bash

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

# 检查系统是否已安装Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh My Zsh is not installed. Installing Oh My Zsh..."
    # 使用curl命令安装Oh My Zsh
    sh -c "$(curl -fsSL https://gitee.com/pocmon/ohmyzsh/raw/master/tools/install.sh)"
else
    echo "Oh My Zsh is installed."
fi


# Define a function which rename a `target` file to `target.backup` if the file
# exists and if it's a 'real' file, ie not a symlink
backup() {
  target=$1
  if [ -e "$target" ]; then
    if [ ! -L "$target" ]; then
      mv "$target" "$target.backup"
      echo "-----> Moved your old $target config file to $target.backup"
    fi
  fi
}

symlink() {
  file=$1
  link=$2
  if [ ! -e "$link" ]; then
    echo "-----> Symlinking your new $link"
    ln -s $file $link
  fi
}




# Install zsh-syntax-highlighting plugin
CURRENT_DIR=`pwd`
ZSH_PLUGINS_DIR="$HOME/.oh-my-zsh/custom/plugins"
mkdir -p "$ZSH_PLUGINS_DIR" && cd "$ZSH_PLUGINS_DIR"
if [ ! -d "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting" ]; then
  echo "-----> Installing zsh plugin 'zsh-syntax-highlighting'..."
  git clone https://gitee.com/asddfdf/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  git clone https://gitee.com/chenweizhen/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi
cd "$CURRENT_DIR"


# For all files `$name` in the present folder except `*.sh`, `README.md`, `settings.json`,
# and `config`, backup the target file located at `~/.$name` and symlink `$name` to `~/.$name`
for name in aliases gitconfig zprofile zshrc; do
  if [ ! -d "$name" ]; then
    target="$HOME/.$name"
    backup $target
    symlink $PWD/$name $target
  fi
done



# Refresh the current terminal with the newly installed configuration
exec zsh

echo "👌 Carry on with git setup!"
