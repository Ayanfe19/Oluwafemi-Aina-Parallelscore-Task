# Add repo for APISIX 
helm repo add apisix https://charts.apiseven.com

# Update Repo
helm repo update

# Create Namespace for the ingress object
kubectl create namespace ingress-apisix

# Set up APISIX Ingress Controller with DAPR Support
helm install apisix apisix/apisix -f dapr-annotations.yaml -n ingress-apisix

# Set up DAPR Sidecar resource for APISIX using configurations in config.json

# Select DAPR-APISIX as Upstream Service