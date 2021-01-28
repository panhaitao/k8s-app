wget https://get.helm.sh/helm-v3.5.0-linux-amd64.tar.gz
tar -zxvf helm-v3.5.0-linux-amd64.tar.gz
cp linux-amd64/helm /usr/bin/helm

helm repo add stable http://mirror.azure.cn/kubernetes/charts
helm repo add incubator http://mirror.azure.cn/kubernetes/charts-incubator
helm install --name kafka --namespace kafka -f kafka-values.yaml incubator/kafka
