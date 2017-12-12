# gcloud compute scp --recurse /media/kjartan/DATADRIVE11/ConNetQuake/data/*  instance-convnetquake:/home/kjartan/ConvNetQuake/data --zone us-east1-c
cd ~/ConvNetQuake
export PYTHONPATH=$PWD
./bin/preprocess/cluster_events --src data/catalogs/OK_2014-2015-2016.csv --dst data/6_clusters --n_components 6 --model KMeans
./bin/preprocess/create_dataset_events.py --stream_dir data/streams --catalog data/6_clusters/catalog_with_cluster_ids.csv --output_dir data/6_clusters/events --save_mseed True --plot True
./bin/preprocess/data_augmentation.py --tfrecords data/6_clusters/events --output data/6_clusters/augmented_data/augmented_stetch_std1-2.tfrecords --std_factor 1.2
./bin/preprocess/create_dataset_noise.py --stream_path data/streams/GSOK029_8-2014.mseed --catalog data/catalogs/Benz_catalog.csv --output_dir data/noise_OK029/noise_august --save_mseed
mkdir ~/ConvNetQuake/data/6_clusters/train/
mkdir ~/ConvNetQuake/data/6_clusters/train/negative
mkdir ~/ConvNetQuake/data/6_clusters/train/positive
mkdir ~/ConvNetQuake/data/6_clusters/test_events
mkdir ~/ConvNetQuake/data/6_clusters/test_noise
cp -r data/noise_OK029/noise_august/* ../train/negative
cd ~/ConvNetQuake/data/6_clusters/events
cp GS0K029_10-2015.tfrecords  ../train/positive
cp GSOK027_2-2014.tfrecords ../train/positive
cp GSOK029_1-2016.tfrecords ../train/positive
cp GSOK029_6-2014.tfrecords ../train/positive
cp GS0K029_11-2015.tfrecords ../train/positive
cp GSOK027_2-2015.tfrecords ../train/positive
cp GSOK029_12-2014.tfrecords ../train/positive
cp GSOK029_6-2016.tfrecords ../train/positive
cp GS0K029_12-2015.tfrecords ../train/positive
cp GSOK027_3-2014.tfrecords ../train/positive
cp GSOK029_12-2016.tfrecords ../train/positive
cp GSOK029_7-2016.tfrecords ../train/positive
cp GS0K029_4-2015.tfrecords ../train/positive
cp GSOK027_3-2015.tfrecords ../train/positive
cp GSOK029_2-2014.tfrecords ../train/positive
cp GSOK029_8-2014.tfrecords ../train/positive
cp GS0K029_5-2015.tfrecords ../train/positive
cp GSOK027_4-2014.tfrecords ../train/positive
cp GSOK029_2-2015.tfrecords ../train/positive
cp GSOK029_8-2016.tfrecords ../train/positive
cp GS0K029_6-2015.tfrecords ../train/positive
cp GSOK027_5-2014.tfrecords ../train/positive
cp GSOK029_2-2016.tfrecords ../train/positive
cp GSOK029_9-2014.tfrecords ../train/positive
cp GS0K029_7-2015.tfrecords ../train/positive
cp GSOK027_6-2014.tfrecords ../train/positive
cp GSOK029_3-2014.tfrecords ../train/positive
cp GSOK029_9-2016.tfrecords ../train/positive
cp GS0K029_8-2015.tfrecords ../train/positive
cp GSOK027_8-2014.tfrecords ../train/positive
cp GSOK029_3-2015.tfrecords ../train/positive
cp GS0K029_9-2015.tfrecords ../train/positive
cp GSOK027_9-2014.tfrecords ../train/positive
cp GSOK029_3-2016.tfrecords ../train/positive
cp GSOK027_10-2014.tfrecords ../train/positive
cp GSOK029_10-2014.tfrecords ../train/positive
cp GSOK029_4-2014.tfrecords ../train/positive
cp GSOK027_11-2014.tfrecords ../train/positive
cp GSOK029_10-2016.tfrecords ../train/positive
cp GSOK029_4-2016.tfrecords ../train/positive
cp GSOK027_1-2015.tfrecords ../train/positive
cp GSOK029_11-2016.tfrecords ../train/positive
cp GSOK029_5-2014.tfrecords ../train/positive
cp GSOK027_12-2014.tfrecords ../train/positive
cp GSOK029_1-2015.tfrecords ../train/positive
cp GSOK029_5-2016.tfrecords ../train/positive
cp GSOK027_11-2014.tfrecords ../train/test_events
cp GSOK029_10-2016.tfrecords ../train/test_events
cp GSOK029_4-2016.tfrecords ../train/test_events
cp GSOK027_1-2015.tfrecords ../train/test_events
cp GSOK029_11-2016.tfrecords ../train/test_events
cp GSOK029_5-2014.tfrecords ../train/test_events
cp GSOK027_12-2014.tfrecords ../train/test_events
cp GSOK029_1-2015.tfrecords ../train/test_events
cp GSOK029_5-2016.tfrecords ../train/test_events
cd ~/ConvNetQuake
mkdir ~/ConvNetQuake/output
mkdir ~/ConvNetQuake/convnetquake
cp -r data/noise_OK029/noise_august/* ~/ConvNetQuake/data/6_clusters/test_noise
export LC_ALL=C
sudo tensorboard --port 80  --logdir ~/ConvNetQuake/output/convnetquake/ConvNetQuake &
./bin/train --dataset data/6_clusters/train --checkpoint_dir output/convnetquake --n_clusters 6

