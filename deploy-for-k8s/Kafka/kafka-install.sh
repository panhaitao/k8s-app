helm repo add stable http://mirror.azure.cn/kubernetes/charts
helm repo add incubator http://mirror.azure.cn/kubernetes/charts-incubator
helm install --name kafka --namespace kafka -f kafka-values.yaml incubator/kafka
