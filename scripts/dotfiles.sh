
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
# 检测插件是否已安装
# Install zsh-autosuggestions plugin
CURRENT_DIR=`pwd`
ZSH_PLUGINS_DIR="$HOME/.oh-my-zsh/custom/plugins"
if [ ! -d "$ZSH_PLUGINS_DIR/zsh-autosuggestions" ]; then
  echo "-----> Installing zsh plugin 'zsh-autosuggestions'..."
  git clone https://gitee.com/asddfdf/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

if [ ! -d "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting" ]; then
  echo "-----> Installing zsh plugin 'zsh-syntax-highlighting'..."
  git clone https://gitee.com/asddfdf/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi



# Install zsh-syntax-highlighting plugin
# CURRENT_DIR=`pwd`
# ZSH_PLUGINS_DIR="$HOME/.oh-my-zsh/custom/plugins"
# mkdir -p "$ZSH_PLUGINS_DIR" && cd "$ZSH_PLUGINS_DIR"
# if [ ! -d "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting" ]; then
#   echo "-----> Installing zsh plugin 'zsh-syntax-highlighting'..."
#   git clone https://gitee.com/asddfdf/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
#   git clone https://gitee.com/chenweizhen/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# fi
# cd "$CURRENT_DIR"


# For all files `$name` in the present folder except `*.sh`, `README.md`, `settings.json`,
# and `config`, backup the target file located at `~/.$name` and symlink `$name` to `~/.$name`
for name in aliases zshrc; do
  if [ ! -d "$name" ]; then
    target="$HOME/.$name"
    backup $target
    symlink $PWD/config/$name $target
  fi
done



# Refresh the current terminal with the newly installed configuration

# 请输入git用户名
read -p "请输入git用户名:" git_username
# 请输入git邮箱
read -p "请输入git邮箱:" git_email

git config --global user.name "$git_username"
git config --global user.email "$git_email"



# zsh
# source ~/.zshrc
echo "👌 Carry on with git setup!"
exec zsh