cd docs
for chart in $(find ../charts/* -maxdepth 0 -type d); do
    helm package ../charts/$chart
done

helm repo index . --url https://ans-group.github.io/helm-charts