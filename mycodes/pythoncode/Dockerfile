FROM oraclelinux:8.3
# using some os image 
# will get file system of that OS 
# Docker engine will look for from Img locally first if not found
# then it will download it from Docker HUB 
MAINTAINER  ashutoshh@linux.com , 9509957594
# Image developer information (optional part)
RUN  dnf install python3 -y
#  RUN will give you shell to execute commands 
# during image building time 
RUN mkdir  /pycode
# creating directory 
# in new docker image will be using to store code 
COPY  hello.py  /pycode/hello.py
# it will copy data from docker Client to Docker Engine (host)
# inside that image which we are building 
WORKDIR  /pycode
# to change directory location like cd command in windows/linux/mac
# during image build time it will change and maintain directory 
CMD  ["python3","hello.py"]
# CMD will be used for defining default
# parent process by cmd and there will be only one CMD in Dockerfile