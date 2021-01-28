helm repo add gkarthiks https://gkarthiks.github.io/helm-charts
helm install kafka-exporter gkarthiks/prometheus-kafka-exporter –set kafkaServer=kafka:9092  –namespace=kube-public

## prometheus config

– job_name: ‘redis-ha-exporter’
   static_configs:
   – targets: [‘http://kafka-exporter-prometheus-kafka-exporter.kube-public:9308’]

## Grafana DashBoard 

* https://grafana.com/grafana/dashboards/7589
