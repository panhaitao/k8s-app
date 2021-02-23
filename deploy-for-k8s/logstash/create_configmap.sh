cat > logstash.conf <<EOF
input {
  kafka {
    bootstrap_servers => '172.17.77.246:9092'
    topics => test001
    codec => json {
            charset => "UTF-8"
        }
  }
}

filter {
    # 将message转为json格式
    if [type] == "log" {
        json {
            source => "message"
            target => "message"
        }
    }
}


output {
  elasticsearch {
    hosts => ["10.10.46.42:9200"]
    index => "k8s_log-20210223"
  }
}
EOF


cat > logstash.yml <<EOF
http.host: "0.0.0.0"
xpack.monitoring.elasticsearch.hosts: [ "http://10.10.46.42:9200" ]
EOF

kubectl delete cm logstash-pipeline-config -n logs
kubectl create configmap logstash-pipeline-config --from-file=logstash.conf --namespace logs
kubectl delete cm logstash-config -n logs
kubectl create configmap logstash-config --from-file=logstash.yml --namespace logs
kubectl delete pods elk-logstash-0 -n logs
