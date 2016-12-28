sudo apt-get update
sudo apt-get install -y privoxy
sudo echo 'forward-socks5   /               10.0.2.2:1080 . ' >> /etc/privoxy/config
sudo /etc/init.d/privoxy restart
sudo echo 'export http_proxy=http://127.0.0.1:8118' >> /etc/profile
sudo echo 'export https_proxy=http://127.0.0.1:8118' >> /etc/profile
source /etc/profile

