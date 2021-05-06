# getting started with Kubernetes 

## checking node status from client side 

```
 kubectl   get  no
NAME                            STATUS   ROLES                  AGE   VERSION
ip-172-31-72-151.ec2.internal   Ready    <none>                 24h   v1.21.0
k8s-master                      Ready    control-plane,master   24h   v1.21.0
k8s-minion2                     Ready    <none>                 24h   v1.21.0

```

### checking pods 

```
❯ kubectl   get  po
NAME          READY   STATUS             RESTARTS   AGE
amanpod-1     1/1     Running            1          16h
anshul-1      1/1     Running            1          16h
ashupod-1     1/1     Running            1          16h
hatpod        1/1     Running            1          16h
kpod-1        1/1     Running            1          16h
kptpod-11     1/1     Running            1          16h
namanpod1     1/1     Running            1          16h
nandhapod-1   1/1     Running            1          16h
nihapod-1     1/1     Running            1          16h
nodepod       0/1     CrashLoopBackOff   12         16h
rmnpod-1      1/1     Running            1          16h
ypod-1        1/1     Running            1          16h
❯ kubectl   get  po -o wide
NAME          READY   STATUS             RESTARTS   AGE   IP                NODE                            NOMINATED NODE   READINESS GATES
amanpod-1     1/1     Running            1          16h   192.168.27.209    k8s-minion2                     <none>           <none>
anshul-1      1/1     Running            1          16h   192.168.207.208   ip-172-31-72-151.ec2.internal   <none>           <none>
ashupod-1     1/1     Running            1          16h   192.168.207.207   ip-172-31-72-151.ec2.internal   <none>           <none>
hatpod        1/1     Running            1          16h   192.168.27.210    k8s-minion2                     <none>           <none>
kpod-1        1/1     Running        


```


