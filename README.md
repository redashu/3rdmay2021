# who can attend 

<img src="p.png">

## app deployment in past 

<img src="pastapp.png">

## solution to hardware based deployment is virtualization 

<img src="vm.png">

## Introduction to container platforms 

<img src="cre.png">

## what is container 

<img src="cont.png">

## understand  kernel 

<img src="kernel.png">

## Docker info 

<img src="dockerinfo.png">

## to download docker desktop for windows 10 

['Docker desktop windows 10'](https://docs.docker.com/docker-for-windows/install/)

## Docker desktop reality 

<img src="dd.png">


## Docker architecture 

<img src="arch1.png">


<img src="arch2.png">

## Intalling docker. in linux based OS 

```
[root@ip-172-31-6-70 ~]# yum   install  docker  -y
Failed to set locale, defaulting to C
Loaded plugins: extras_suggestions, langpacks, priorities, update-motd
amzn2-core                                                                      | 3.7 kB  00:00:00     
Resolving Dependencies
--> Running transaction check
---> Package docker.x86_64 0:20.10.4-1.amzn2 will be installed
--> Processing Dependency: runc >= 1.0.0 for package: docker-20.10.4-1.amzn2.x86_64
--> Processing Dependency: libcgroup >= 0.40.rc1-5.15 for package: docker-20.10.4-1.amzn2.x86_64
--> Processing Dependency: containerd >= 1.3.2 for package: docker-20.10.4-1.amzn2.x86_64
--> Processing Dependency: pigz for package: docker-20.10.4-1.amzn2.x86_64
--> Running transaction check
---> Package containerd.x86_64 0:1.4.4-1.amzn2 will be installed
---> Package libcgroup.x86_64 0:0.41-21.amzn2 will be installed
---> Package pigz.x86_64 0:2.3.4-1.amzn2.0.1 will be installed
---> Package runc.x86_64 0:1.0.0-0.1.20210225.git12644e6.amzn2 will be installed
--> Finished Dependency Resolution

Dependencies Resolved

```


## starting docker engine 

```
[root@ip-172-31-6-70 ~]# systemctl start  docker 
[root@ip-172-31-6-70 ~]# systemctl enable  docker 
Created symlink from /etc/systemd/system/multi-user.target.wants/docker.service to /usr/lib/systemd/system/docker.service.
[root@ip-172-31-6-70 ~]# systemctl status  docker 
● docker.service - Docker Application Container Engine
   Loaded: loaded (/usr/lib/systemd/system/docker.service; enabled; vendor preset: disabled)
   Active: active (running) since Mon 2021-05-03 06:34:03 UTC; 15s ago
     Docs: https://docs.docker.com
 Main PID: 3949 (dockerd)
   CGroup: /system.slice/docker.service
           └─3949 /usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock --default-u...

May 03 06:34:03 ip-172-31-6-70.ec2.internal dockerd[3949]: time="2021-05-03T06:34:03.047333813Z" l...pc
May 03 06:34:03 ip-172-31-6-70.ec2.internal dockerd[3949]: time="2021-05-03T06:34:03.047352803Z" l...pc
May 03 06:34:03 ip-172-3

```

## configure docker engine to accept remote connection 

<img src="de.png">

## Docker client options 

<img src="dokcercli.png">

## Using docker cli to send request 

### check docker engine connection 

```
❯ docker  context   ls
NAME                TYPE                DESCRIPTION                               DOCKER ENDPOINT               KUBERNETES ENDPOINT                    ORCHESTRATOR
default *           moby                Current DOCKER_HOST based configuration   unix:///var/run/docker.sock   https://54.227.223.108:6443 (ashuns)   swarm


```

### creating context 

```
❯ docker  context  create  ashuDE   --docker  "host=tcp://54.235.252.191:2375"
ashuDE
Successfully created context "ashuDE"
❯ docker  context   ls
NAME                TYPE                DESCRIPTION                               DOCKER ENDPOINT               KUBERNETES ENDPOINT                    ORCHESTRATOR
ashuDE              moby                                                          tcp://54.235.252.191:2375                                            
default *           moby                Current DOCKER_HOST based configuration   unix:///var/run/docker.sock   https://54.227.223.108:6443 (ashuns)   swarm

```

### change / switch context 

```
❯ docker  context   use  ashuDE
ashuDE
❯ docker  context   ls
NAME                TYPE                DESCRIPTION                               DOCKER ENDPOINT               KUBERNETES ENDPOINT                    ORCHESTRATOR
ashuDE *            moby                                                          tcp://54.235.252.191:2375                                            
default             moby                Current DOCKER_HOST based configuration   unix:///var/run/docker.sock   https://54.227.223.108:6443 (ashuns)   swarm


```


