# Setup DARP
brew install dapr/tap/dapr-cli
dapr init -k

# Install Helm 
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

# Setup DAPR State Store Component Using Redis
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install redis bitnami/redis

# Create the Redis Component
kubectl apply -f redis.yaml

# Get Dapr Dashboard
dapr dashboard -k

# Build and push to docker
docker build -t ayanf3d3v/pyserver:0.1 .
docker push ayanf3d3v/pyserver:0.1

# Deploy on K8s
kubectl apply -f server.yaml