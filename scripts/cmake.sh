version=3.28
build=3
## don't modify from here
limit=3.25
result=$(echo "$version >= $limit" | bc -l)
os=$([ "$result" == 1 ] && echo "linux" || echo "linux")
mkdir ~/temp
cd ~/temp
wget https://cmake.org/files/v$version/cmake-$version.$build-$os-x86_64.sh 
sudo mkdir /opt/cmake
sudo sh cmake-$version.$build-$os-x86_64.sh --prefix=/opt/cmake

sudo ln -fs /opt/cmake/cmake-$version.$build-$os-x86_64/bin/cmake /usr/local/bin/cmake
sudo ln -fs /usr/local/bin/cmake /usr/bin/cmake

rm -fr ~/temp