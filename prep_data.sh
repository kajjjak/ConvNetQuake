gcloud compute scp --recurse /media/kjartan/DATADRIVE11/ConNetQuake/data/*  instance-convnetquake:/home/kjartan/ConvNetQuake/data --zone us-east1-c
export PYTHONPATH=$PWD
sudo ./bin/preprocess/cluster_events --src data/catalogs/OK_2014-2015-2016.csv --dst data/6_clusters --n_components 6 --model KMeans
sudo ./bin/preprocess/create_dataset_events.py --stream_dir data/streams --catalog data/6_clusters/catalog_with_cluster_ids.csv --output_dir data/6_clusters/events --save_mseed True --plot True
sudo ./bin/preprocess/data_augmentation.py --tfrecords data/6_clusters/events --output data/6_clusters/augmented_data/augmented_stetch_std1-2.tfrecords --std_factor 1.2
sudo ./bin/preprocess/create_dataset_noise.py --stream_path data/streams/GSOK029_8-2014.mseed --catalog data/catalogs/Benz_catalog.csv --output_dir data/noise_OK029/noise_august
sudo tensorboard --port 80  --logdir output/convnetquake/ConvNetQuake &

