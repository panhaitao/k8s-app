cat > prometheus.yml <<EOF
global:
  scrape_interval:     1s
  evaluation_interval: 1s

scrape_configs:
  - job_name: 'pod_monitor'
    static_configs:
    - targets: ['127.0.0.1:9270']
  - job_name: kubernetes-pods
    kubernetes_sd_configs:
    - role: pod
  - job_name: kubernetes-nodes
    kubernetes_sd_configs:
    - role: node
  - job_name: kubernetes-service-endpoints
    kubernetes_sd_configs:
    - role: endpoints
EOF
kubectl create configmap prometheus-config --from-file=prometheus.yml --namespace kube-system
