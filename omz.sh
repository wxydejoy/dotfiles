
# 检查系统是否已安装Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh My Zsh is not installed. Installing Oh My Zsh..."
    # 使用curl命令安装Oh My Zsh
    sh -c "$(curl -fsSL https://gitee.com/pocmon/ohmyzsh/raw/master/tools/install.sh)"
else
    echo "Oh My Zsh is installed."
fi

