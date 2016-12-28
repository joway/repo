#!/usr/bin/env bash
echo "Checking Host location";
ip=$(curl -s https://api.ipify.org)
location=$(curl -s http://freeapi.ipip.net/$ip)
xshrc=~/.bashrc

# sudo 
command_exists() {
	command -v "$@" > /dev/null 2>&1
}
sh_c='sh -c'
if [ "$user" != 'root' ]; then
	if command_exists sudo; then
		sh_c='sudo -E sh -c'
	elif command_exists su; then
		sh_c='su -c'
	else
		cat >&2 <<-'EOF'
		Error: this installer needs the ability to run commands as root.
		We are unable to find either "sudo" or "su" available to make this happen.
		EOF
		exit 1
	fi
fi

# check location
if [[ $location == *"中国"* ]]
then
  echo "FUCKING GFW";

  echo "FUCK ubuntu";
	UBUNTU_VER=$(lsb_release -sr)
	if [ "$UBUNTU_VER" != '14.04']; then
  	$sh_c "curl http://repo.joway.wang/ubuntu-14.04.sources.list > /etc/apt/sources.list"
	elif [ "$UBUNTU_VER" != '16.04']; then
		$sh_c "curl http://repo.joway.wang/ubuntu-16.04.sources.list > /etc/apt/sources.list"
	fi

	if [ ! -d ~/.pip ]; then
		echo "FUCK python";
		mkdir ~/.pip
		$sh_c "curl http://repo.joway.wang/pip.conf > ~/.pip/pip.conf"
	fi

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
