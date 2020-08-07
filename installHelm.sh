#!/bin/bash

cd /tmp
curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get > install-helm.sh
chmod u+x install-helm.sh
./install-helm.sh
#Setup Tiller Service account !
kubectl -n kube-system create serviceaccount tiller
kubectl create clusterrolebinding tiller --clusterrole cluster-admin --serviceaccount=kube-system:tiller
helm init --service-account tiller
