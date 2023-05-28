
# 判断是否存在.ssh目录
if [ ! -d "~/.ssh" ]; then
    # 创建.ssh目录
    mkdir ~/.ssh
fi

# 复制目录下的authorized_keys文件到~/.ssh/目录下
cp -r authorized_keys ~/.ssh/

# 复制目录下的authorized_keys文件到rsa.pub
cp -r authorized_keys ~/.ssh/rsa.pub

# 修改权限
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
chmod 644 ~/.ssh/rsa.pub
