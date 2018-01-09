export GCSFUSE_REPO=gcsfuse-`lsb_release -c -s`
echo "deb http://packages.cloud.google.com/apt $GCSFUSE_REPO main" | sudo tee /etc/apt/sources.list.d/gcsfuse.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo apt-get update
sudo apt-get install gcsfuse
#gcloud auth application-default login
mkdir ~/gs_convnetquake
#gcsfuse convnetquake ConvNetQuake/data -- https://github.com/GoogleCloudPlatform/gcsfuse/blob/master/docs/mounting.md
# -- https://cloud.google.com/storage/docs/quickstart-gsutil
#gsutil -m cp -r gs://convnetquake/imo/* ~/ConvNetQuake/data 
gcsfuse convnetquake ~/gs_convnetquake
ln -s gs_convnetquake/imo ~/ConvNetQuake/data
