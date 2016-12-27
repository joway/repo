sudo apt-get update
sudo apt-get install -y privoxy
echo 'forward-socks5   /               10.0.2.2:1080 . '
sudo /etc/init.d/privoxy restart
echo 'export http_proxy=http://127.0.0.1:8118' >> /etc/profile
echo 'export https_proxy=http://127.0.0.1:8118' >> /etc/profile
source /etc/profile

