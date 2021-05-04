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

## Restart policy in containers

[restartpolicy](https://docs.docker.com/config/containers/start-containers-automatically/)

### implementin restart policy 

```
docker  run -itd --name ashuc4  --restart always    alpine ping 127.0.0.1 
```

## filtering output from inspect of container 

```
10058  docker  inspect  ashuc4 
10059  docker  inspect  ashuc4  -f  '{{.Id}}'
10060  docker  inspect  ashuc4  --format='{{.Id}}'
10061  docker  inspect  ashuc4  --format='{{.State.Status}}'
10062* docker inspect  ashuc4  -f  '{{.HostConfig.RestartPolicy}}'
10063* docker inspect  ashuc4  -f  '{{.HostConfig.RestartPolicy.Name}}'

```

### info about container update command 

```
❯ docker  update  ashuc4  --restart always
ashuc4
❯ docker  update  --help

Usage:  docker update [OPTIONS] CONTAINER [CONTAINER...]

Update configuration of one or more containers

Options:
      --blkio-weight uint16        Block IO (relative weight), between 10 and 1000, or 0 to disable (default 0)
      --cpu-period int             Limit CPU CFS (Completely Fair Scheduler) period
      --cpu-quota int              Limit CPU CFS (Completely Fair Scheduler) quota
      --cpu-rt-period int          Limit the CPU real-time period in microseconds
      --cpu-rt-runtime int         Limit the CPU real-time runtime in microseconds
  -c, --cpu-shares int             CPU shares (relative weight)
      --cpus decimal               Number of CPUs
      --cpuset-cpus string         CPUs in which to allow execution (0-3, 0,1)
      --cpuset-mems string         MEMs in which to allow execution (0-3, 0,1)
      --kernel-memory bytes        Kernel memory limit
  -m, --memory bytes               Memory limit
      --memory-reservation bytes   Memory soft limit
      --memory-swap bytes          Swap limit equal to memory plus swap: '-1' to enable unlimited swap
      --pids-limit int             Tune container pids limit (set -1 for unlimited)
      --restart string             Restart policy to apply when a container exits
      
  ```
  
  
