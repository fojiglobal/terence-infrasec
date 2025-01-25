#!/bin/bash

#View Pods
kubectl get pods -n dev
kubectl get pods -n stage
kubectl get pods -n prod
# kubectl get pods -n kubescape


#View Service
kubectl get service -n dev
kubectl get service -n stage
kubectl get service -n prod
# kubectl get service -n kubescape

#!/bin/bash/

#------ List all namespaces
kubectl get namespaces

#------ List all nodes in each namespace
kubectl get nodes -n dev -o wide
kubectl get nodes -n stage -o wide
kubectl get nodes -n prod -o wide
kubectl get nodes -n kubespace -o wide

#------ List all pods in each namespace
kubectl get pods -n dev -o wide
kubectl get pods -n stage -o wide
kubectl get pods -n prod -o wide
kubectl get pods -n kubespace -o wide

#------ List all deployments in each namespace
kubectl get deployments -n dev -o wide
kubectl get deployments -n stage -o wide
kubectl get deployments -n prod -o wide
kubectl get deployments -n kubespace -o wide

#------ List all services in each namespace
kubectl get services -n dev -o wide
kubectl get services -n stage -o wide
kubectl get services -n prod -o wide
kubectl get services -n kubespace -o wide

#--------Deleting a cluster
eksctl delete cluster -f eks.yml

#--------Creating namespace
kubectl create namespace dev
kubectl create namespace stage
kubectl create namespace prod

#---------- Deploying juiceshop app to each environment/namespaces

kubectl apply -f juiceapp-dev.yml -n dev 
kubectl apply -f juiceapp-stage.yml -n stage 
kubectl apply -f juiceapp-prod.yml -n prod 