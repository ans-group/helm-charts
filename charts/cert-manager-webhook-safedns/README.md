# cert-manager-webhook-safedns

## Introduction

This Helm chart installs the SafeDNS cert-manager webhook into a Kubernetes cluster

## Prerequisites

* Kubernetes 1.17+ (see note [here](https://github.com/ans-group/cert-manager-webhook-safedns#installing))

## Installation

* `helm repo add ans https://ans-group.github.io/helm-charts`
* `helm repo update`
* `helm install cert-manager-webhook-safedns ans/cert-manager-webhook-safedns`

## Configuration

| Parameter | Description | Default |
| --------- | ----------- | ------- |
| `groupName`                       | Name of API group                 | `acme.k8s.ans.io` |
| **Image** |
| `image.repository`                | Image                             | `ansgroup/cert-manager-webhook-safedns` |
| `image.tag`                       | Image tag                         | `latest` |
| **Cert Manager** |
| `certManager.namespace`           | cert-manager namespace            | `cert-manager` |
| `certManager.serviceAccountName`  | cert-manager service account name | `cert-manager` |
| **Resources** |
| `resources`                       | CPU/Memory resources              | `{}` |
| **Service** |
| `service.type`                    | Service type                      | `NodePort` |
| `service.port`                    | Service port                      | `80` |
| **Node Selector** |
| `nodeSelector`                    | Node selector                     | `{}` |
| **Tolerations** |
| `tolerations`                     | Tolerations                       | `[]` |
| **Affinity** |
| `affinity`                        | Affinity                          | `{}` |

## Upgrading from versions prior to `v1.3.x`

The default value for `groupName` has changed. If this was not set previously, this will cause previous issuers to fail. There are two options for this scenario:

- Deploy new version of chart whilst setting `groupName` to previous value `acme.k8s.ukfast.io`
- Update issuers to use new `groupName` of `acme.k8s.ans.io`