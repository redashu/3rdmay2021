# Docker revision 

## Certification tracks in containerization world 

<img src="cert.png">

## Docker component one more time 

<img src="compo.png">

## Docker volumes 

<img src="dvol.png">

### clean up docker engine data 

```
10010  docker  rm $(docker ps -aq) -f
10011  docker  rmi $(docker images -q) -f
10012  history
10013  docker network ls
10014  docker  network prune 
10015  docker network ls
❯ docker  images ;  docker  ps -a ; docker network ls
REPOSITORY   TAG       IMAGE ID   CREATED   SIZE
CONTAINER ID   IMAGE     COMMAND   CREATED   STATUS    PORTS     NAMES
NETWORK ID     NAME      DRIVER    SCOPE
ba151bd62c3e   bridge    bridge    local
87e51b407d02   host      host      local
ec2c48f04c56   none      null      local
```

## VOlume by docker 

### creating volume 

```
❯ docker  volume   create   ashuvol1
ashuvol1
❯ docker  volume  ls
DRIVER    VOLUME NAME
local     8f7748e6b618428df405156774a54e86f3dacd4ab3bea89db4340714db59b7e6
local     00968884402c057daecce3b142be348f51c95bf12fd97101a5cae1d8a6d339cb
local     ashuvol1

```

### creating container with docker volume 

<img src="vol1.png">

### checking mount 

```
❯ docker  exec -it  ashuc1 sh
/ # ls
bin     etc     lib     mnt     opt     root    sbin    sys     usr
dev     home    media   mydata  proc    run     srv     tmp     var
/ # cd  mydata/
/mydata # ls
/mydata # mkdir  a b c d
/mydata # ls
a  b  c  d
/mydata # echo hello   >a.txt
/mydata # ls
a      a.txt  b      c      d
/mydata # exit

```

### mounting above volume into another container 

```
❯ docker  run -ti --rm  -v  ashuvol1:/new:ro   oraclelinux:8.3  bash
Unable to find image 'oraclelinux:8.3' locally
8.3: Pulling from library/oraclelinux
dd34f38d274c: Pull complete 
Digest: sha256:af3182ee6c1e56f18fc1fecaf638da57d7c47233862e5c32f5ad723a6ab4c6db
Status: Downloaded newer image for oraclelinux:8.3
[root@b6ae9fc31969 /]# 
[root@b6ae9fc31969 /]# 
[root@b6ae9fc31969 /]# ls
bin  boot  dev  etc  home  lib  lib64  media  mnt  new  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
[root@b6ae9fc31969 /]# cd  new/
[root@b6ae9fc31969 new]# ls
a  a.txt  b  c  d
[root@b6ae9fc31969 new]# mkdir  hello
mkdir: cannot create directory 'hello': Read-only file system
[root@b6ae9fc31969 new]# rmdir   a
rmdir: failed to remove 'a': Read-only file system

```

## more deep volume concept 

<img src="vol2.png">

## mounting multiple volume in a single container 

```
 docker  run -itd --name ashuc2  -v  ashuvol1:/hello1:ro   -v  ashuvol2:/hello2:rw  alpine sh
7701b8d5bf78632b4b46917f8c1c8dfae07a24cbaaf91a0a7e0297d3f8856e97

```

## BInd mounts in docker container 

<img src="bindm.png">

### example 1

```
❯ docker  run -tid --name  ashuc3  -v   /etc:/myetc:ro   alpine sh
f7e390c7b1be9e79f140242702451eb04a097d005070fff7aaba9015a177bd1f

❯ docker  ps
CONTAINER ID   IMAGE     COMMAND   CREATED              STATUS              PORTS     NAMES
f241efb891b0   alpine    "sh"      10 seconds ago       Up 7 seconds                  richik3
f7e390c7b1be   alpine    "sh"      About a minute ago   Up About a minute             ashuc3
❯ docker  exec -it  ashuc3  sh
/ # cd  /myetc/
/myetc # ls
DIR_COLORS               docker                   ld.so.conf.d             pkcs11                   shadow
DIR_COLORS.256color      docker-runtimes.d        libaudit.conf            pki                      shadow-
DIR_COLORS.lightbgcolor  dracut.conf              libnl                    plymouth                 shells
GREP_COLORS              dracut.conf.d            libuser.conf             pm                       skel
GeoIP.conf               e2fsck.

```


### mounting file from host to container 

```
❯ docker  run -tid --name  ashuc4  -v   /etc/hosts:/aa.txt:ro   alpine sh
13c1bf66a9c251cd490c9253bbfcaa0e667af49034b7685d1a9c553f13a8071c
docker  exec -it%                                                                                                              ❯ docker  exec -it  ashuc4 sh
/ # cat  /aa.txt 
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost6 localhost6.localdomain6

```

### final socket example 

```
 docker  run -tid --name webui1  -v  /var/run/docker.sock:/var/run/docker.sock -p 1234:9000  portainer/portainer
Unable to find image 'portainer/portainer:latest' locally
latest: Pulling from portainer/portainer
94cfa856b2b1: Pull complete 
49d59ee0881a: Pull complete 
a2300fd28637: Pull complete 
Digest: sha256:fb45b43738646048a0a0cc74fcee2865b69efde857e710126084ee5de9be0f3f
Status: Downloaded newer image for portainer/portainer:latest
abf8ec94d5a945524bfdd267628ece4a62bf8a66c66ddd50a6746a2207a25983

```




