wget https://github.com/prometheus/node_exporter/releases/download/v1.0.1/node_exporter-1.0.1.linux-amd64.tar.gz
tar zxvf node_exporter-1.0.1.linux-amd64.tar.gz -C /data/
mv /data/node_exporter-1.0.1.linux-amd64 /data/node_exporter
useradd prometheus -s /sbin/nologin
chown prometheus:prometheus -R /data/node_exporter
