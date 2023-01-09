set -e
curl -o ~/google-cloud-cli-412.0.0-linux-x86_64.tar.gz https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-412.0.0-linux-x86_64.tar.gz
cd ~
ls
tar -xf ~/google-cloud-cli-412.0.0-linux-x86_64.tar.gz
./google-cloud-sdk/install.sh --usage-reporting false --command-completion false --path-update true -q
