

export ZSH="$HOME/.oh-my-zsh"





setopt autocd              # change directory just by typing its name
setopt correct            # auto correct mistakes
setopt interactivecomments # allow comments in interactive mode
setopt magicequalsubst     # enable filename expansion for arguments of the form ‘anything=expression’
# setopt nonomatch           # hide error message if there is no match for the pattern
setopt notify              # report the status of background jobs immediately
setopt numericglobsort     # sort filenames numerically when it makes sense
setopt promptsubst         # enable command substitution in prompt

# enable completion features
autoload -Uz compinit
compinit -d ~/.cache/zcompdump
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # case insensitive tab completion

# History configurations
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=2000
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user 
# force zsh to show the complete history
alias history="history 0"


# Getting IP addresses to add to prompt
IP1=$(ip -4 addr | grep -v 127.0.0.1 | grep -v secondary | grep eth0 | grep -Po "inet \K[\d.]+") # Get normal interface, may need to be changed
IP2=$(ip -4 addr | grep -v 127.0.0.1 | grep -v secondary | grep tun0 | grep -Po "inet \K[\d.]+") # Get VPN IP if connected
IP3=$(ip -4 addr | grep -v 127.0.0.1 | grep -v secondary | grep wlan0 | grep -Po "inet \K[\d.]+") # Get Wireless IP if connected

# Create prompts based on which interfaces are found
if [ $IP1 ]; then
 LOCAL="%F{green}─🖥️ %F{cyan}$IP1%b%F{green}"
else
 LOCAL=""
fi

if [ $IP2 ]; then
    VPN="%F{green}─🔒%F{yellow}$IP2%b%F{green}"
else
    VPN=""
fi

if [ $IP3 ]; then
    WIFI="%F{green}─📶%F{red}$IP3%F{green}"
else
    WIFI=""
fi











ZSH_THEME="ys"



# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"


plugins=(git colored-man-pages colorize cp man command-not-found sudo ubuntu archlinux zsh-navigation-tools z extract history-substring-search python  gitfast last-working-dir common-aliases zsh-syntax-highlighting  zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

## 输入法，ibus和fcitx
# export GTK_IM_MODULE=fcitx
# export QT_IM_MODULE=fcitx
# export QT4_IM_MODULE=fcitx
# export XMODIFIERS=@im=fcitx

alias cls='clear'

## 安装trash-cli
## trash-cli 常用功能
## trash-put 将文件或目录移入回收站
## trash-empty 清空回收站
## trash-list 列出回收站中的文件
## trash-restore 还原回收站中的文件
## trash-rm 删除回首站中的单个文件
# alias rm='trash-put'
# alias rmclean='trash-empty'
# alias rmrest='trash-restore'
# alias rmlist='trash-list'
# alias rmrm='trash-rm'

## 安装 zsh-syntax-highlighting 不同发行版安装位置不同修改路径
# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

## 安装 zsh-autosuggestions 不同发行版安装位置不同修改路径
# source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
## 修改提示字符颜色
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=cyan"#                                                                                                                                  





# Disable warning about insecure completion-dependent directories
ZSH_DISABLE_COMPFIX=true

# Actually load Oh-My-Zsh
# source "${ZSH}/oh-my-zsh.sh"
# unalias rm # No interactive rm by default (brought by plugins/common-aliases)
# unalias lt # we need `lt` for https://github.com/localtunnel/localtunnel


# Store your own aliases in the ~/.aliases file and load the here.
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"


# Encoding stuff for the terminal
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# argcomplete for ros2 & colcon
source /usr/share/colcon_cd/function/colcon_cd.sh
export _colcon_cd_root=/opt/ros/humble/
source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.zsh


# argcomplete for ros2 & colcon
eval "$(register-python-argcomplete3 ros2)"
eval "$(register-python-argcomplete3 colcon)"

UNZIP_DISABLE_ZIPBOMB_DETECTION=TRUE
export UNZIP_DISABLE_ZIPBOMB_DETECTION

setopt nonomatch
