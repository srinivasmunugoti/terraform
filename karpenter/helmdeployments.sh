# aws load balancer controller

kubectl create ns test
helm repo add aws https://aws.github.io/eks-charts
helm repo update

helm install my-aws-load-balancer-controller aws/aws-load-balancer-controller --set clusterName=karpenter --set serviceAccount.create=false --set serviceAccount.name=aws-load-balancer-controller --version 1.6.0 --namespace test


#metric server install

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
helm install my-jenkins jenkinsci/jenkins --version 4.6.1 --namespace test






