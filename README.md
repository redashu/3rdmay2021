# Docker again 

## Intro to Namespaces & Cgroups 

<img src="nscg.png">

## checking stats of a container 

<img src="stats.png">

## memory restriction in a container 

<img src="mem.png">

### little info about CPU (processor)

<img src="cpuinfo.png">

###  cgropus

```
docker  run -itd --name ashuc3  --memory 200m --cpuset-cpus=0 --cpu-shares=30    alpine ping 127.0.0.1
```

## for better understanding like performance tunning purpose 

[tunehostcontainer](https://docs.docker.com/config/containers/resource_constraints/)

