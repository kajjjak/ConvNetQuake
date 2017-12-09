gcloud compute scp --recurse /media/kjartan/DATADRIVE11/ConNetQuake/data/*  instance-convnetquake:/home/kjartan/ConvNetQuake/data --zone us-east1-c
export PYTHONPATH=$PWD
sudo ./bin/preprocess/cluster_events --src data/catalogs/OK_2014-2015-2016.csv --dst data/6_clusters --n_components 6 --model KMeans
sudo ./bin/preprocess/create_dataset_events.py --stream_dir data/streams --catalog data/6_clusters/catalog_with_cluster_ids.csv --output_dir data/6_clusters/events --save_mseed True --plot True
sudo ./bin/preprocess/data_augmentation.py --tfrecords data/6_clusters/events --output data/6_clusters/augmented_data/augmented_stetch_std1-2.tfrecords --std_factor 1.2
sudo ./bin/preprocess/create_dataset_noise.py --stream_path data/streams/GSOK029_8-2014.mseed --catalog data/catalogs/Benz_catalog.csv --output_dir data/noise_OK029/noise_august
sudo tensorboard --port 80  --logdir output/convnetquake/ConvNetQuake &

cp GS0K029_10-2015.tfrecords  ../train/negative
cp GSOK027_2-2014.tfrecords ../train/negative
cp GSOK029_1-2016.tfrecords ../train/negative
cp GSOK029_6-2014.tfrecords ../train/negative
cp GS0K029_11-2015.tfrecords ../train/negative
cp GSOK027_2-2015.tfrecords ../train/negative
cp GSOK029_12-2014.tfrecords ../train/negative
cp GSOK029_6-2016.tfrecords ../train/negative
cp GS0K029_12-2015.tfrecords ../train/negative
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
cd ..
cd ..
mkdir output
./bin/train --dataset data/6_clusters/train --checkpoint_dir output/convnetquake --n_clusters 6

