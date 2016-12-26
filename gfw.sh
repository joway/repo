#!/usr/bin/env bash
echo "Checking Host location";
ip=$(curl -s https://api.ipify.org)
location=$(curl -s http://freeapi.ipip.net/$ip)
xshrc=~/.bashrc

if [[ $location == *"中国"* ]]
then
  echo "FUCKING GFW";

  echo "FUCK ubuntu";
  cat> /etc/apt/sources.list<<EOF
deb http://mirrors.aliyun.com/ubuntu/ trusty main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ trusty-security main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ trusty-proposed main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ trusty main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse
EOF

  echo "FUCK python";
  mkdir ~/.pip
  cat> ~/.pip/pip.conf<<EOF
[global]
index-url=http://mirrors.aliyun.com/pypi/simple/
[install]
trusted-host=mirrors.aliyun.com
EOF

  if hash npm 2>/dev/null; then
    echo "FUCK npm";
 	echo '\n#alias for cnpm\nalias cnpm="npm --registry=https://registry.npm.taobao.org \
  	  --cache=$HOME/.npm/.cache/cnpm \
  	  --disturl=https://npm.taobao.org/dist \
  	  --userconfig=$HOME/.cnpmrc"' >> xshrc && source xshrc
  fi

  if hash gem 2>/dev/null; then
  	echo "FUCK ruby";
 	gem sources --add https://gems.ruby-china.org/ --remove https://rubygems.org/
  fi

  echo "GFW FUCKED"
else
  echo "Hello World";
fi
