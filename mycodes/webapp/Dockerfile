FROM oraclelinux:8.3
MAINTAINER ashutoshh@linux.com
RUN dnf install httpd -y
# we are installing apache httpd 
COPY ashu.html  /var/www/html/index.html
# ashu.html to index.html 
# because httpd server read only from index.html file name by default
COPY  docker.png  /var/www/html/docker.png
ENTRYPOINT httpd -DFOREGROUND
# now httpd -DFOREGROUND is a script to start httpd service 
# when you will use httpd as system admin 
