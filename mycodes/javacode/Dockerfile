FROM openjdk
# pre installed java image by docker hub 
MAINTAINER  ashutoshh@linux.com
RUN mkdir /code
ADD hello.java  /code/hello.java
# COPY and ADD both are same except one difference 
# ADD can take data from URL also while COPY will only take from 
# docker client machine 
WORKDIR /code
RUN  javac  hello.java 
# compiling java code 
CMD ["java","myclass"]
# running code during container creation time