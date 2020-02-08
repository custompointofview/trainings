#!/bin/sh

echo "==================================="
echo "==== Deploying K8s Node! ===="
echo "==================================="

MASTER_IP="192.168.33.11"
POD_NETWORK_CIDR="10.244.0.0/16"
KUBETOKEN="b029ee.968a33e8d8e6bb0d"

sudo kubeadm reset -f
sudo kubeadm join --token "${KUBETOKEN}" --discovery-token-unsafe-skip-ca-verification "${MASTER_IP}":6443

echo "==================================="
echo "==== Done! ===="
echo "==================================="
