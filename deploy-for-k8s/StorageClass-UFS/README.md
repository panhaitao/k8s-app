# nfs-client-provisioner-deploy

git clone https://github.com/panhaitao/k8s-app.git
cd k8s-app/deploy-for-k8s/StorageClass-UFS/
kubectl  apply -f deployment.yaml
kubectl  apply -f rbac.yaml
kubectl  apply -f class.yaml
