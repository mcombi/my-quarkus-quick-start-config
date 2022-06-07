# my-quarkus-quick-start-config

Builds:
Repo: https://github.com/mcombi/my-quarkus-quick-start.git
Quay: mcombi/quarkus-getting-started

Config:
repo: https://github.com/mcombi/my-quarkus-quick-start-config.git


Tekton pipelines must be created in namespace "demo-tekton-build-env" and has two versions:
classic -> the secret with github token is not encrypted
sealed-secrets -> the secret is encrypted and also requires the following steps


Install sealed secrets:
oc apply -f https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.18.0/controller.yaml
Install kubeseal:
sudo wget https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.18.0/kubeseal-linux-amd64 -O kubeseal

Get Cert from controller 
kubeseal --fetch-cert > public-cert.pem

Seal the secret (replace username and token in github-secret-ss):
kubeseal --format yaml --cert ../../public-cert.pem < github-secret-ss.yaml > github-secret-sealed.yaml
