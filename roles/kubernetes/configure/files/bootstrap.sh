kubectl create -f https://download.elastic.co/downloads/eck/1.9.1/crds.yaml
kubectl apply -f https://download.elastic.co/downloads/eck/1.9.1/operator.yaml

sleep 60

kubectl apply -f https://k8s.io/examples/admin/dns/dnsutils.yaml

kubectl apply -f /opt/kubernetes/elastic-quickstart/pv.yaml
kubectl apply -f /opt/kubernetes/elastic-quickstart/sc.yaml
kubectl apply -f /opt/kubernetes/elastic-quickstart/pvc.yaml

kubectl apply -f  /opt/kubernetes/elastic-quickstart/quickstart.yaml
kubectl apply -f  /opt/kubernetes/elastic-quickstart/kibana.yaml
