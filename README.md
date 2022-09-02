# my-quarkus-quick-start-config

Builds:
Repo: https://github.com/mcombi/my-quarkus-quick-start.git
Quay: mcombi/quarkus-getting-started

Config:
repo: https://github.com/mcombi/my-quarkus-quick-start-config.git

As Architecture diagram shows, with argo or RHACM you can install the tekton pipeline that will be used to build and deploy the application. 
The tekton pipeline are in tekton folder, with the standard kustomize directory structure. 
Tekton pipelines must be created in namespace "demo-tekton-build-env" (NEED TO IMPROVE) and has two versions:
classic -> the secret with github token is not encrypted, it is only obfuscated
sealed-secrets -> the secret is encrypted and also requires the following steps


Install sealed secrets:
oc apply -f https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.18.0/controller.yaml
Install kubeseal:
sudo wget https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.18.0/kubeseal-linux-amd64 -O kubeseal

Get Cert from controller 
kubeseal --fetch-cert > public-cert.pem

Seal the secret (replace username and token in github-secret-ss):
kubeseal --format yaml --cert ../../public-cert.pem < github-secret-ss.yaml > github-secret-sealed.yaml


The application - my-quarkus-quick-start can be deployed with Argo cd referencing the directory quick-start/overlays which is not standard kustomize directory structure and should be fixed.


![gnome-shell-screenshot-ceqbcf](https://user-images.githubusercontent.com/100132715/178200548-2094642b-dbd2-42f6-aba4-212d2692d3d9.png)
