#!/bin/bash
oc login $1
oc apply -f monitoring/101-cluster-monitoring-config-map.yaml
oc apply -f monitoring/102-workload-monitoring-config.yaml
oc -n openshift-user-workload-monitoring get pod -w