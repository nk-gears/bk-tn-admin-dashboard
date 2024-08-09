version=v2.0.1
npx prettier --write .
gcloud config set project bk-tn-admin-panel-app

gcloud builds submit --tag europe-west1-docker.pkg.dev/bk-tn-admin-panel-app/cloud-run-source-deploy/timesheet:${version} --project=bk-tn-admin-panel-app  --region=europe-west1

gcloud run deploy timesheet \
--image=europe-west1-docker.pkg.dev/bk-tn-admin-panel-app/cloud-run-source-deploy/timesheet:${version} \
--region=europe-west1 \
--project=bk-tn-admin-panel-app \
&& gcloud run services update-traffic timesheet --to-latest