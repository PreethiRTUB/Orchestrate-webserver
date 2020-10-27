# Webserver 

## Installation
```Note: Created and tested the webserver in ubuntu 20.4 ```

### Dependencies
The following dependencies need to be installed in order to run the webserver
- [`Install Docker`] (https://docs.docker.com/engine/install/ubuntu/)
- [`Install kubectl`] (https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- [`Install minikube`] (https://minikube.sigs.k8s.io/docs/start/)

### Execution Steps
1. Execute the below command to deploy the webserver
```
$ bash run.sh
or 
$ ./run.sh
```

2. To query the endpoint execute below commands
```
export MINIKUBE_IP_ADDRESS=$(minikube ip)
export PORT=80
export HOST_NAME="local.tree.org"
curl $MINIKUBE_IP_ADDRESS:$PORT/tree -H Host:$HOST_NAME
```

### Clean up script
```
$ bash cleanup.sh
or 
$ ./cleanup.sh
```
