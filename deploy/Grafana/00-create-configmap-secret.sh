kubectl  create ns monitoring

cat > prometheus-db.yaml <<EOF
apiVersion: 1

datasources:
  - name: Prometheus
    type: prometheus
    access: proxy
    url: http://localhost:9090
EOF
kubectl create secret generic grafana-datasources --from-file=prometheus-db.yaml --namespace monitoring


cat > generic.yaml <<EOF
apiVersion: 1
providers:
  - name: 'default'
    orgId: 1
    folder: ''
    folderUid: ''
    type: file
    disableDeletion: true
    updateIntervalSeconds: 10
    allowUiUpdates: true
    options:
      path: /var/lib/grafana/dashbords/
      foldersFromFilesStructure: true
EOF

kubectl create configmap grafana-dashboards --from-file=generic.yaml --namespace monitoring
