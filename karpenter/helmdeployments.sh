
#metric server install
kubectl create ns test
helm repo add metrics-server https://kubernetes-sigs.github.io/metrics-server/
helm repo update
helm install my-metrics-server metrics-server/metrics-server --version 3.11.0 --namespace test

#ingress deploy

helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
helm install my-ingress-nginx ingress-nginx/ingress-nginx --version 4.7.1 --namespace test

#jenkins install

helm repo add jenkinsci https://charts.jenkins.io/
helm repo update
helm install my-jenkins jenkinsci/jenkins  --set storageClassName="gp2" --version 4.6.1 --namespace test 






