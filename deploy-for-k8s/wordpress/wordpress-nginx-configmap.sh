cat > nginx.conf <<EOF
EOF

kubectl create configmap nginx-config --from-file=nginx.conf --namespace default
