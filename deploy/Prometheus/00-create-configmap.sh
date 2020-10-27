cat > prometheus-config <<EOF
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
    relabel_configs:
    - action: keep
      regex: true
      source_labels:
      - __meta_kubernetes_pod_annotation_prometheus_io_scrape
    - action: replace
      regex: (.+)
      source_labels:
      - __meta_kubernetes_pod_annotation_prometheus_io_path
      target_label: __metrics_path__
    - action: replace
      regex: ([^:]+)(?::\d+)?;(\d+)
      replacement: $1:$2
      source_labels:
      - __address__
      - __meta_kubernetes_pod_annotation_prometheus_io_port
      target_label: __address__
    - action: labelmap
      regex: __meta_kubernetes_pod_label_(.+)
    - action: replace
      source_labels:
      - __meta_kubernetes_namespace
      target_label: kubernetes_namespace
    - action: replace
      source_labels:
      - __meta_kubernetes_pod_name
      target_label: kubernetes_pod_name
EOF
kubectl create configmap prometheus-config --from-file=prometheus-config.yaml
