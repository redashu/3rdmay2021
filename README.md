# Welcome to day5 Kubernetes training 

## recap 

<img src="recap.png">

## to check k8s token for dashboard

```
0050  kubectl  describe   secret  kubernetes-dashboard-token-p9sld  -n kubernetes-dashboard
❯ kubectl  describe   secret  kubernetes-dashboard-token-p9sld  -n kubernetes-dashboard
Name:         kubernetes-dashboard-token-p9sld
Namespace:    kubernetes-dashboard
Labels:       <none>
Annotations:  kubernetes.io/service-account.name: kubernetes-dashboard
              kubernetes.io/service-account.uid: d316e210-153e-4132-ab8b-51a843ffdd2f

Type:  kubernetes.io/service-account-token

Data
====
namespace:  20 bytes
token:      eyJhbGciOiJSUzI1NiIsImtpZCI6Il9jZWFxTGhVRmt6M3IwRmRSdnEyZnZWR1phemNjMUtTNHh2c3VpMVk5VjAifQ.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJrdWJlcm5ldGVzLWRhc2hib2FyZCIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VjcmV0Lm5hbWUiOiJrdWJlcm5ldGVzLWRhc2hib2FyZC10b2tlbi1wOXNsZCIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50Lm5hbWUiOiJrdWJlcm5ldGVzLWRhc2hib2FyZCIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50LnVpZCI6ImQzMTZlMjEwLTE1M2UtNDEzMi1hYjhiLTUxYTg0M2ZmZGQyZiIsInN1YiI6InN5c3RlbTpzZXJ2aWNlYWNjb3VudDprdWJlcm5ldGVzLWRhc2hib2FyZDprdWJlcm5ldGVzLWRhc2hib2FyZCJ9.wUCkqjw1bn4ucgqdfGPhaZPxbTpj1F4cgYlVxN4yplIUm6hCu5ZRHOA9N6ll3OsmJLEQDMs5hWw2HjRVvzImrCjNtaF-32Z5eau0PQ1BORV777BbKumSkTm9ydaC719pgkRQPx3SE0iwdXNH4AhmIq-mtgzuq4_Nw3iGR6_QeB
ca.crt:     1066 bytes


```


## Starting deployment in k8s again 

### deploying web app

```
kubectl  create  deployment  ashuwebapp1  --image=dockerashu/nginxor:v1  --dry-run=client -o yaml >nginxweb.yaml
```

### deleting all from my namespace

```
❯ kubectl   delete all --all -n ashuspace
pod "ashudeploy1-7b8874b7d8-r8qv5" deleted
pod "ashupod-1" deleted
pod "ashupod-2" deleted
pod "ashuwebpod" deleted
service "ashusvc1" deleted
deployment.apps "ashudeploy1" deleted

```

### after deployment we are creating service

```
❯ kubectl  get deploy
NAME          READY   UP-TO-DATE   AVAILABLE   AGE
ashuwebapp1   1/1     1            1           2m58s
❯ kubectl expose deployment  ashuwebapp1  --type NodePort  --port 1234 --target-port 80 --name ashusvc1
service/ashusvc1 exposed
❯ kubectl  get  svc
NAME       TYPE       CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
ashusvc1   NodePort   10.100.10.167   <none>        1234:31316/TCP   6s

```

## final deployment 

```
❯ ls
ashudep.yml   ashupod1.yaml ashurc.yaml   ashusvc1.yaml ashuwebapp    nginxweb.yaml pod1.json     webpod1.yaml
❯ kubectl  apply -f  nginxweb.yaml
deployment.apps/ashuwebapp1 created
❯ kubectl  get  deployment
NAME          READY   UP-TO-DATE   AVAILABLE   AGE
ashuwebapp1   1/1     1            1           19s
❯ kubectl  get  po
NAME                          READY   STATUS    RESTARTS   AGE
ashuwebapp1-84889dcbf-f4bck   1/1     Running   0          25s
❯ kubectl  expose deployment  ashuwebapp1  --type NodePort --port 9090  --target-port 80 --name x1ashuc1
service/x1ashuc1 exposed
❯ kubectl  get  svc
NAME       TYPE       CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
x1ashuc1   NodePort   10.109.100.43   <none>        9090:30596/TCP   7s

```

### scaling application 

```
❯ kubectl  get deploy
NAME          READY   UP-TO-DATE   AVAILABLE   AGE
ashuwebapp1   1/1     1            1           7m57s
❯ kubectl  scale deployment  ashuwebapp1  --replicas=3
deployment.apps/ashuwebapp1 scaled
❯ kubectl  get deploy
NAME          READY   UP-TO-DATE   AVAILABLE   AGE
ashuwebapp1   3/3     3            3           8m19s
❯ kubectl  get  po
NAME                          READY   STATUS    RESTARTS   AGE
ashuwebapp1-84889dcbf-7pnzt   1/1     Running   0          13s
ashuwebapp1-84889dcbf-f4bck   1/1     Running   0          8m28s
ashuwebapp1-84889dcbf-wls6f   1/1     Running   0          13s

```

## loadbalancer service

<img src="lbsvc.png">

## final end to end deployment 

<img src="e2e.png">


## rolling updates 

<img src="rolling.png">

## UPgrading. application 

### checking existing docker image version in deployment 

```
❯ kubectl  describe  deploy  ashuwebapp1
Name:                   ashuwebapp1
Namespace:              ashuspace
CreationTimestamp:      Fri, 07 May 2021 10:56:12 +0530
Labels:                 app=ashuwebapp1
Annotations:            deployment.kubernetes.io/revision: 1
Selector:               app=ashuwebapp1
Replicas:               3 desired | 3 updated | 3 total | 3 available | 0 unavailable
StrategyType:           RollingUpdate
MinReadySeconds:        0
RollingUpdateStrategy:  25% max unavailable, 25% max surge
Pod Template:
  Labels:  app=ashuwebapp1
  Containers:
   nginxor:
    Image:        dockerashu/nginxor:v11
    
```

### updataing image after build in deployment 

```
kubectl  set  image  deployment  ashuwebapp1  nginxor=dockerashu/nginxor:v22
deployment.apps/ashuwebapp1 image updated

```

### checking rolling updates

```
❯ kubectl  get  deploy
NAME          READY   UP-TO-DATE   AVAILABLE   AGE
ashuwebapp1   3/3     3            3           70m
❯ kubectl  get  po
NAME                          READY   STATUS    RESTARTS   AGE
ashuwebapp1-8c996979f-7sxdx   1/1     Running   0          59s
ashuwebapp1-8c996979f-dvrld   1/1     Running   0          61s
ashuwebapp1-8c996979f-fm9mp   1/1     Running   0          64s

```

### few more commands for k8s 

```
10128  kubectl  describe  deploy  ashuwebapp1 
10129  history
10130* kubectl  describe  deploy  ashuwebapp1 
10131  kubectl  set  image  deployment  ashuwebapp1  nginxor=dockerashu/nginxor:v22
10132* kubectl  describe  deploy  ashuwebapp1 
10133  kubectl  get  deploy 
10134  kubectl  get  po
10135  kubectl  exec -it ashuwebapp1-8c996979f-7sxdx  -- bash 
❯ kubectl  rollout  undo  deployment ashuwebapp1
deployment.apps/ashuwebapp1 rolled back

```


