gcloud beta compute --project "caramel-park-139813" instances create "instance-convnetquake" --zone "us-east1-c" --machine-type "n1-standard-4" --subnet "default" --maintenance-policy "TERMINATE" --service-account "1064499109163-compute@developer.gserviceaccount.com" --scopes "https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring.write","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" --accelerator type=nvidia-tesla-k80,count=1 --min-cpu-platform "Automatic" --tags "http-server","https-server" --image "ubuntu-1604-xenial-v20171208" --image-project "ubuntu-os-cloud" --boot-disk-size "200" --boot-disk-type "pd-ssd" --boot-disk-device-name "instance-convnetquake"
gcloud compute ssh instance-convnetquake --zone us-east1-c  --command "git clone https://github.com/kajjjak/ConvNetQuake.git && cd ConvNetQuake/ && ./setup_gctesla.sh"
