# kubernetes-qperf
Basic network performance testing

```
alpine:3.7
qperf from testing repo
kubernetes > 1.8.0
```

Change SERVER_ADDR in the client deployment config to your cluster's record.

## 1 Example output from AKS (Azure managed Kubernetes)
Standard D2 v2 (2 vcpus, 7 GB memory)
```
iteration:1  t:16     latency  =  171 us
iteration:2  t:39     latency  =  225 us
iteration:3  t:37     latency  =  205 us
iteration:4  t:41     latency  =  174 us
iteration:5  t:37     latency  =  210 us
iteration:6  t:11     latency  =  184 us
iteration:7  t:48     latency  =  237 us
iteration:8  t:13     latency  =  178 us
iteration:9  t:36     latency  =  198 us
iteration:10  t:10     latency  =  187 us
iteration:11  t:16     latency  =  171 us
iteration:12  t:32     latency  =  167 us
iteration:13  t:34     latency  =  162 us
iteration:14  t:33     latency  =  221 us
iteration:15  t:55     latency  =  197 us
iteration:16  t:55     latency  =  213 us
iteration:17  t:31     latency  =  202 us
iteration:18  t:49     latency  =  226 us
iteration:19  t:35     latency  =  176 us
iteration:20  t:14     latency  =  218 us
```

## 2 Setup
```
kubectl apply -f ./service
```


## To add
antiafinity or daemonset
make sure client is not on the same node as server.
