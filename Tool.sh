#!/bin/bash
clear

# system
OS_TYPE=""

if [ -f /etc/os-release ]; then
    . /etc/os-release
    if [ "$ID" = "debian" ] || [ "$ID" = "ubuntu" ]; then
        OS_TYPE="debian"
    elif [ "$ID" = "centos" ]; then
        OS_TYPE="centos"
    elif [ "$ID" = "alpine" ]; then
        OS_TYPE="alpine"
    else
        OS_TYPE="unknown"
    fi
    echo "Your System:$OS_TYPE"
else
    echo "Not able to determine the operating system"
fi

echo -e ""
echo -e "\e[33m歡迎使用 Xue Li Li's Script！博客地址：https://blog.xueli.lol 脚本持續更新中...\e[0m"
echo -e "\e[33m初始化環境后安裝程式會更加方便。\e[0m"
echo -e "\e[32m快捷命令：Tool\e[0m"
echo -e ""

echo "0.更新最新脚本"
echo "1.開啓 SWAP虛擬内存"
echo "2.開啓 BBR"
echo "3.安裝docker"
echo "4.Netflix檢測"
echo "5.安裝X-UI"
echo "6.安裝XrayR"
echo "7.WARP 01"
echo "8.WARP 02"
echo "9.安裝哪吒面板"
echo "10.安裝極光面板"
echo "11.融合怪VPS評測"
echo "12.解除GitHub限制"
echo "13.初始化環境"
echo "14.安裝ArgoX"
echo "15.安裝1panel"
echo "16.安裝3X-UI"
echo "17.搭建TG代理"
echo "18.搭建V2ray-Agent"
echo "19.LXC開小鷄(Ubuntu/Debian)"
echo "20.一鍵DD系統"
echo "21.一鍵修改程式源(大陸源)"
echo "22.DisneyPlus檢測"
echo "23.iptables一键转发脚本"
echo "24.Shadowsocks Go版 一键安装管理脚本"
echo "25.Reality 一键脚本"
echo "26.阿里云/騰訊云 去除云監控"
echo "27.IPV6 修改DNS"
echo "28.Sing-box"
echo -e ""

echo -ne "\e[36m請選擇功能：\e[0m"
read number

if [ "$number" == "0" ]; then
    wget -O Tool https://blog.xueli.lol/Script/Tool.sh; mv Tool /usr/local/bin/; cd /usr/local/bin/ && chmod +x Tool && bash Tool
elif [ "$number" == "1" ]; then
    wget https://raw.githubusercontent.com/ChellyL/swap_change/main/swap.sh && bash swap.sh
elif [ "$number" == "2" ]; then
    wget -N --no-check-certificate "https://raw.githubusercontent.com/chiakge/Linux-NetSpeed/master/tcp.sh" && chmod +x tcp.sh && ./tcp.sh
elif [ "$number" == "3" ]; then
    curl -fsSL https://get.docker.com | bash -s docker
    systemctl start docker
    systemctl enable docker
elif [ "$number" == "4" ]; then
    wget -O nf https://github.com/sjlleo/netflix-verify/releases/download/2.01/nf_2.01_linux_amd64 && chmod +x nf && clear && ./nf
elif [ "$number" == "5" ]; then
    if [ "$OS_TYPE" != "alpine" ]; then
        bash <(curl -Ls https://raw.githubusercontent.com/vaxilu/x-ui/master/install.sh)
    else
        apk add curl&&apk add bash && bash <(curl -Ls https://raw.githubusercontent.com/Lynn-Becky/Alpine-x-ui/main/alpine-xui.sh)
    fi
elif [ "$number" == "6" ]; then
    if [ "$OS_TYPE" != "alpine" ]; then
        bash <(curl -Ls https://raw.githubusercontent.com/XrayR-project/XrayR-release/master/install.sh)
    else
        wget https://github.com/Cd1s/alpineXrayR/releases/download/one-click/install-xrayr.sh && chmod +x install-xrayr.sh && bash install-xrayr.sh
        echo "Xrayr重启自启命令：rc-service XrayR restart"
    fi
elif [ "$number" == "7" ]; then
    wget -N https://gitlab.com/fscarmen/warp/-/raw/main/menu.sh && bash menu.sh
elif [ "$number" == "8" ]; then
    wget -N https://gitlab.com/Misaka-blog/warp-script/-/raw/main/warp.sh && bash warp.sh
elif [ "$number" == "9" ]; then
    curl -L https://raw.githubusercontent.com/naiba/nezha/master/script/install.sh  -o nezha.sh && chmod +x nezha.sh && sudo ./nezha.sh
elif [ "$number" == "10" ]; then
    bash <(curl -fsSL https://raw.githubusercontent.com/Aurora-Admin-Panel/deploy/main/install.sh)
elif [ "$number" == "11" ]; then
    curl -L https://gitlab.com/spiritysdx/za/-/raw/main/ecs.sh -o ecs.sh && chmod +x ecs.sh && bash ecs.sh
elif [ "$number" == "12" ]; then
    echo "2a01:4f8:c010:d56::2 github.com
    2a01:4f8:c010:d56::3 api.github.com
    2a01:4f8:c010:d56::4 codeload.github.com
    2a01:4f8:c010:d56::5 objects.githubusercontent.com
    2a01:4f8:c010:d56::6 ghcr.io
    2a01:4f8:c010:d56::7 pkg.github.com npm.pkg.github.com maven.pkg.github.com
    nuget.pkg.github.com rubygems.pkg.github.com" | tee -a /etc/hosts
    clear
    echo "已解除限制。"
elif [ "$number" == "13" ]; then

    if [ "$OS_TYPE" = "debian" ]; then
        echo "This is a Debian or Ubuntu system"
        apt update -y && apt upgrade -y && apt install -y wget curl vim lsof sudo git
    elif [ "$OS_TYPE" = "centos" ]; then
        echo "This is a CentOS system"
        yum update -y && yum upgrade -y && yum install -y wget curl vim lsof sudo git
    elif [ "$OS_TYPE" = "alpine" ]; then
        apk update && apk upgrade && apk add wget curl vim lsof sudo git
    else
        echo "Unknown system: $OS_TYPE"
    fi

elif [ "$number" == "14" ]; then
    bash <(wget -qO- https://raw.githubusercontent.com/fscarmen/argox/main/argox.sh)

elif [ "$number" == "15" ]; then
    if [ "$OS_TYPE" = "debian" ]; then
        echo "This is a Debian system"
        curl -sSL https://resource.fit2cloud.com/1panel/package/quick_start.sh -o quick_start.sh && bash quick_start.sh
    elif [ "$OS_TYPE" = "centos" ]; then
        echo "This is a CentOS system"
        curl -sSL https://resource.fit2cloud.com/1panel/package/quick_start.sh -o quick_start.sh && sh quick_start.sh
    elif [ "$OS_TYPE" = "ubuntu" ]; then
        echo "This is a Ubuntu system"
        curl -sSL https://resource.fit2cloud.com/1panel/package/quick_start.sh -o quick_start.sh && sudo bash quick_start.sh
    else
        echo "Unknown system: $OS_TYPE"
    fi

elif [ "$number" == "16" ]; then
    bash <(curl -Ls https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh)

elif [ "$number" == "17" ]; then
    ## 新建目录
    echo "自動創建TG代理目錄：/home/mtproxy"
    mkdir /home/mtproxy && cd /home/mtproxy

    ## 开始安装
    curl -s -o mtproxy.sh https://raw.githubusercontent.com/sunpma/mtp/master/mtproxy.sh && chmod +x mtproxy.sh && bash mtproxy.sh

elif [ "$number" == "18" ]; then
    wget -P /root -N --no-check-certificate "https://raw.githubusercontent.com/mack-a/v2ray-agent/master/install.sh" && chmod 700 /root/install.sh && /root/install.sh

elif [ "$number" == "19" ]; then
    if [ "$OS_TYPE" = "debian" ]; then
        echo "This is a Debian system"
        wget -N --no-check-certificate https://raw.githubusercontent.com/MXCCO/lxdpro/main/lxdpro.sh && bash lxdpro.sh
    else
        echo "脚本僅支持：Ubuntu/Debian"
    fi

elif [ "$number" == "20" ]; then

    # 下載脚本
    wget --no-check-certificate -qO InstallNET.sh 'https://raw.githubusercontent.com/leitbogioro/Tools/master/Linux_reinstall/InstallNET.sh' && chmod a+x InstallNET.sh
    
    echo -e "脚本自動下載 InstallNET.sh 到當前目錄。"
    echo "詳細參數可參考 Github項目地址：https://github.com/leitbogioro/Tools"
    echo "1.DD Debian 12"
    echo "2.DD Kali"
    echo "3.DD Alpine"
    echo "4.DD CentOS 9"
    echo "5.DD Ubuntu 22.04"
    echo "6.DD Windows 11"
    echo "7.DD Windows 10"
    echo "8.DD Windows 2012"
    echo "9.DD Windows 2016"
    echo "10.DD Windows 2019"
    echo "11.DD Windows 2022"
    echo -e ""

    echo -ne "\e[36m請選擇功能：\e[0m"
    read num

    if [ "$num" == "1" ]; then
        bash InstallNET.sh -debian
    elif [ "$num" == "2" ]; then
        bash InstallNET.sh -kali
    elif [ "$num" == "3" ]; then
        bash InstallNET.sh -alpine
    elif [ "$num" == "4" ]; then
        bash InstallNET.sh -centos
    elif [ "$num" == "5" ]; then
        bash InstallNET.sh -ubuntu
    elif [ "$num" == "6" ]; then
        bash InstallNET.sh -windows
        elif [ "$num" == "7" ]; then
        bash InstallNET.sh -windows 10
        elif [ "$num" == "8" ]; then
        bash InstallNET.sh -windows 2012
        elif [ "$num" == "9" ]; then
        bash InstallNET.sh -windows 2016
        elif [ "$num" == "10" ]; then
        bash InstallNET.sh -windows 2019
        elif [ "$num" == "11" ]; then
        bash InstallNET.sh -windows 2022
    else
        echo "无效的输入！"
    fi

elif [ "$number" == "21" ]; then
    if [ "$OS_TYPE" = "debian" ]; then
        echo "deb http://mirrors.aliyun.com/debian/ buster main non-free contrib
    deb-src http://mirrors.aliyun.com/debian/ buster main non-free contrib
    deb http://mirrors.aliyun.com/debian-security buster/updates main
    deb-src http://mirrors.aliyun.com/debian-security buster/updates main
    deb http://mirrors.aliyun.com/debian/ buster-updates main non-free contrib
    deb-src http://mirrors.aliyun.com/debian/ buster-updates main non-free contrib" > /etc/apt/sources.list
        apt update -y && apt upgrade -y
        echo "執行完畢。"
        
    elif [ "$OS_TYPE" = "centos" ]; then
        echo "[base]
        name=CentOS-\$releasever - Base - mirrors.aliyun.com
        failovermethod=priority
        baseurl=http://mirrors.aliyun.com/centos/\$releasever/os/\$basearch/
                http://mirrors.aliyuncs.com/centos/\$releasever/os/\$basearch/
                http://mirrors.cloud.aliyuncs.com/centos/\$releasever/os/\$basearch/
        gpgcheck=1
        gpgkey=http://mirrors.aliyun.com/centos/RPM-GPG-KEY-CentOS-7

        #released updates 
        [updates]
        name=CentOS-\$releasever - Updates - mirrors.aliyun.com
        failovermethod=priority
        baseurl=http://mirrors.aliyun.com/centos/\$releasever/updates/\$basearch/
                http://mirrors.aliyuncs.com/centos/\$releasever/updates/\$basearch/
                http://mirrors.cloud.aliyuncs.com/centos/\$releasever/updates/\$basearch/
        gpgcheck=1
        gpgkey=http://mirrors.aliyun.com/centos/RPM-GPG-KEY-CentOS-7

        #additional packages that may be useful
        [extras]
        name=CentOS-\$releasever - Extras - mirrors.aliyun.com
        failovermethod=priority
        baseurl=http://mirrors.aliyun.com/centos/\$releasever/extras/\$basearch/
                http://mirrors.aliyuncs.com/centos/\$releasever/extras/\$basearch/
                http://mirrors.cloud.aliyuncs.com/centos/\$releasever/extras/\$basearch/
        gpgcheck=1
        gpgkey=http://mirrors.aliyun.com/centos/RPM-GPG-KEY-CentOS-7" > /etc/yum.repos.d/CentOS-Base.repo
        yum makecache
        clear
        echo "執行完畢。"


    fi


elif [ "$number" == "22" ]; then
    wget -O dp https://github.com/sjlleo/VerifyDisneyPlus/releases/download/1.01/dp_1.01_linux_amd64 && chmod +x dp && clear && ./dp
elif [ "$number" == "23" ]; then
    wget --no-check-certificate -qO natcfg.sh https://raw.githubusercontent.com/arloor/iptablesUtils/master/natcfg.sh && bash natcfg.sh
elif [ "$number" == "24" ]; then
    wget -N --no-check-certificate https://raw.githubusercontent.com/ToyoDAdoubiBackup/doubi/master/ss-go.sh && chmod +x ss-go.sh && bash ss-go.sh
elif [ "$number" == "25" ]; then
    wget -P /root -N --no-check-certificate "https://raw.githubusercontent.com/mack-a/v2ray-agent/master/install.sh" && chmod 700 /root/install.sh && /root/install.sh
elif [ "$number" == "26" ]; then
    echo "1.阿里云"
    echo "2.騰訊云"
    echo -ne "\e[36m請選擇功能：\e[0m"
    read num

    if [ "$num" == "1" ]; then
        wget http://update.aegis.aliyun.com/download/uninstall.sh
        sh uninstall.sh
        wget http://update.aegis.aliyun.com/download/quartz_uninstall.sh
        sh quartz_uninstall.sh
        pkill aliyun-service
        rm -fr /etc/init.d/agentwatch /usr/sbin/aliyun-service
        rm -rf /usr/local/aegis*
        echo "執行完畢。"
    elif [ "$num" == "2" ]; then
        /usr/local/qcloud/stargate/admin/uninstall.sh
        /usr/local/qcloud/YunJing/uninst.sh
        /usr/local/qcloud/monitor/barad/admin/uninstall.sh
        echo "執行完畢。"
    else
        echo "无效的输入！"
    fi
elif [ "$number" == "27" ]; then
    echo "nameserver 2001:4860:4860::8888" | sudo tee /etc/resolv.conf > /dev/null
    echo "nameserver 2001:4860:4860::8844" | sudo tee -a /etc/resolv.conf > /dev/null
    echo "執行完畢。"

elif [ "$number" == "28" ]; then
    bash <(wget -qO- https://raw.githubusercontent.com/fscarmen/sing-box/main/sing-box.sh)

else
    echo "无效的输入！"
fi
