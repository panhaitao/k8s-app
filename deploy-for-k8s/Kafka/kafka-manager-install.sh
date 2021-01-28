helm repo add stable http://mirror.azure.cn/kubernetes/charts
helm repo add incubator http://mirror.azure.cn/kubernetes/charts-incubator
helm install --name kafka-manager --namespace kafka -f kafka-manager-values.yaml stable/kafka-manager
