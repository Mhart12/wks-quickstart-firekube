#!/usr/bin/env bash

set -euo pipefail

log() {
    echo "•" $*
}

log "Deleting Kubernetes nodes and pods"
export PATH=~/.wks/bin:$PATH
sudo env "PATH=$PATH" kubectl get po --all-namespaces -o json | kubectl delete -f -
#kubectl get no --all-namespaces -o json | kubectl delete -f -
#kubectl get po --all-namespaces -o json | kubectl delete -f -

log "Deleting virtual machines"
export PATH=~/.wks/bin:$PATH
sudo env "PATH=$PATH" footloose delete
