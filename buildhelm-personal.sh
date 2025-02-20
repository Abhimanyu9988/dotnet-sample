kubectl -n appdynamics create secret generic cluster-agent-secret --from-literal=controller-key=bm9xa03c6d2p
helm install -f values.yaml abhi-cluster-agent appdynamics-cloud-helmcharts/cluster-agent -n appdynamics
