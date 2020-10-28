# Webserver 

## Installation
```Note: Created and tested the webserver in ubuntu 20.4 ```

### Dependencies
The following dependencies need to be installed in order to run the webserver
- [`Install Docker`] (https://docs.docker.com/engine/install/ubuntu/)
- [`Install kubectl`] (https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- [`Install minikube`] (https://minikube.sigs.k8s.io/docs/start/)

### Execution Steps
Execute the below command to deploy the webserver and access api in one command

Actions Performed by run.sh
- Starts the minikube
- Enables the ingree addon
- Set the eval to docker env context
- Build the image
- Apply the kubernetes manifests
- Query the endpoint and display the result

```
$ bash run.sh
or 
$ ./run.sh
```

Once the `runs.sh` is successfully executed, to query the endpoint execute below commands
```
export MINIKUBE_IP_ADDRESS=$(minikube ip)
export PORT=80
export HOST_NAME="local.tree.org"
curl $MINIKUBE_IP_ADDRESS:$PORT/tree -H Host:$HOST_NAME
```

### Clean up script
Execute the below command to clean

Actions Performed by cleanup.sh
- Removes the kubernetes objects
- Disable the ingree addon
- Unset the eval to docker env context
- Stop the minikube
```
$ bash cleanup.sh
or 
$ ./cleanup.sh
```
