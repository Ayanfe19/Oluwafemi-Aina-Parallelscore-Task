# Setup Helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

# Verufy Helm Installation
helm version

# Add Helm repo
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

# Update repo
helm repo update

# Create Monitoring Namespace
kubectl create namespace monitoring

# Set up secrets for access the Grafana Dashboard
 kubectl create secret generic grafana-admin-credentials --from-file=./admin-user --from-file=admin-password -n monitoring

# Verify the secrets
kubectl describe secret -n monitoring grafana-admin-credentials

# Remove the files containing the credentials from the filesystem
rm admin-user && rm admin-password

# Update values.yaml to include the IP Address of the K8s servers
nano values.yaml

# Create the Kube-Prometheus stack using the configurations from values.yaml
helm upgrade -n monitoring prometheus prometheus-community/kube-prometheus-stack -f values.yaml


# Set up port-forwarding or use Ingress to access the Dashboard
# Replace the Pod with the name of your grafana pod
kubectl port-forward -n monitoring grafana-fcc55c57f-fhjfr 9999:3000
