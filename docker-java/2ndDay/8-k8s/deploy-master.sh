#!/bin/sh

echo "==================================="
echo "==== Deploying K8s Master! ===="
echo "==================================="

MASTER_IP="192.168.33.11"
POD_NETWORK_CIDR="10.244.0.0/16"
KUBETOKEN="b029ee.968a33e8d8e6bb0d"


sudo kubeadm reset -f
# sudo kubeadm init --token-ttl 0
sudo kubeadm init --apiserver-advertise-address="${MASTER_IP}" --pod-network-cidr="${POD_NETWORK_CIDR}" --token "${KUBETOKEN}" --token-ttl 0


mkdir -p $HOME/.kube
cp -Rf /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config
sudo kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

echo "==================================="
echo "==== Done! ===="
echo "==================================="
