#!/bin/bash

mirror_list=(
    "阿里云@mirrors.aliyun.com"
    "腾讯云@mirrors.tencent.com"
    "华为云@repo.huaweicloud.com"
    "网易@mirrors.163.com"
    "搜狐@mirrors.sohu.com"
    "清华大学@mirror.tuna.tsinghua.edu.cn"
    "南京大学@mirrors.nju.edu.cn"
    "上海交通大学@mirror.sjtu.edu.cn"
    "中国科学技术大学@mirrors.ustc.edu.cn"
)

# 初始化结果数组
result=()

# 遍历软件源列表
for mirror in "${mirror_list[@]}"; do
    name="${mirror%%@*}"
    url="${mirror#*@}"
    echo -e "正在测试\033[34m$name\033[0m的响应时间..."
    
    # 进行ping测试，获取平均响应时间（以ms为单位）
    ping_result=$(ping -c 3 -q "$url" | awk -F'/' 'END {print $5}')
    
    # 将结果添加到结果数组
    result+=("$name   $ping_result")

    # echo "$name 的响应时间为 $ping_result ms"
    # 彩色
    echo -e "\033[32m $name \033[0m的响应时间为 \e[31m$ping_result\e[0m ms"
done

# 对结果数组按照响应时间进行排序 从小到大
sorted_result=($(sort -n -k 2 <<< "${result[*]}"))

# 输出最快的软件源 名字和响应时间
echo -e "\033[32m最快的软件源是 ${sorted_result[0]}\033[0m"
