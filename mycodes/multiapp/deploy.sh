#!/bin/bash

if  [  "$x" == "app1" ]
then
    cp -rv /john/app1/*  /var/www/html/
    httpd -DFOREGROUND

elif  [  "$x" == "app2" ]
then
     cp -rv /john/app2/*  /var/www/html/
    httpd -DFOREGROUND
else 
    echo "HEllo this is not corrent !!"  >/var/www/html/index.html
    echo  "Please contact your k8s administrator !! "  >>/var/www/html/index.html
    httpd -DFOREGROUND
fi