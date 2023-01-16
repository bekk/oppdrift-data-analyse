set -e
pip install dbt-bigquery # Installerer dbt
./install_gcloud.sh # Installerer verktøy for å autentisere mot Google Cloud
~/google-cloud-sdk/bin/gcloud auth login --update-adc
