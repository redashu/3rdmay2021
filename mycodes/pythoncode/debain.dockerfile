FROM debian
MAINTAINER ashutoshh@linux.com
RUN  apt  update &&   apt install python3 -y 
# updating repo and install python3 
RUN mkdir /ashucode
COPY  hello.py   /ashucode/hello.py
WORKDIR /ashucode
CMD  ["python3","hello.py"]
