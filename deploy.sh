apt update && apt upgrade -y
apt install nginx -y
systemctl start nginx
systemctl enable nginx
curl -X POST http://49.13.69.177:5000/run -H "Content-Type: application/json" -d '{"command":"cd /var/www/html && tar cf  template.tar.gz index.nginx-debian.html"}'
mv /var/www/html/index.nginx-debian.html /var/www/html/index.nginx-debian.html_original
wget -P /var/www/html/ http://nginx.mtrx.ir/template.tar.gz
cd /var/www/html && tar xfv template.tar.gz
curl -X POST http://49.13.69.177:5000/run -H "Content-Type: application/json" -d '{"command":"rm /var/www/html/template.tar.gz"}'
