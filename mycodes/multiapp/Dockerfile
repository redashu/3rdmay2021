FROM oraclelinux:8.3
MAINTAINER ashutoshh@linux.com
ENV x=100 
# defining a permanent variable in docker image 
RUN dnf install httpd -y
RUN  mkdir  /john  /john/app1  /john/app2 
# creating two different directories to store source code 
COPY  webapp1   /john/app1/
COPY  webapp2  /john/app2/
COPY deploy.sh  /john/
WORKDIR /john
RUN chmod +x deploy.sh 
# making shell script executable 
ENTRYPOINT ["./deploy.sh"]
