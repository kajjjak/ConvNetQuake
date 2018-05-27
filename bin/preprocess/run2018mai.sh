# reciep for run mai 2018

# running kmeans ++, random centroids
#./bin/preprocess/cluster_events --src data/catalogs/OK_2014-2015-2016.csv --dst data/75_clusters --n_components 75 --model KMeans
# result --> /home/kjartan/Documents/Workspace/research/ConvNetQuake/data/100_clusters/cluster_ids_100_comp.eps
# Number of events to cluster:  13858
#  + Calculating the distance matrix
#  + Running KMeans
# number of events 0
#./bin/preprocess/create_dataset_events.py --stream_dir data/streams/data --catalog data/100_clusters/catalog_with_cluster_ids.csv --output_dir data/100_clusters/events --save_mseed True --plot True
./bin/preprocess/data_augmentation.py --tfrecords data/100_clusters/events --output data/100_clusters/augmented_data/augmented_stetch_std1-2.tfrecords --std_factor 1.2
./bin/preprocess/create_dataset_noise.py --stream_path data/streams/GSOK029_8-2014.mseed --catalog data/catalogs/Benz_catalog.csv --output_dir data/noise_OK029/noise_august --save_mseed True --plot True
mkdir data/100_clusters/train/
mkdir data/100_clusters/train/negative
mkdir data/100_clusters/train/positive
mkdir data/100_clusters/test_events
mkdir data/100_clusters/test_noise
cp -r data/noise_OK029/noise_august/* data/100_clusters/train/negative
cp -r data/100_clusters/events data/100_clusters/train/positive
mv data/100_clusters/events/VI.vog..HH.D.2016.054.tfrecords ../test_events
mv data/100_clusters/events/VI.nyl..HH.D.2015.210.tfrecords ../test_events
mv data/100_clusters/events/VI.nyl..HH.D.2016.339.tfrecords ../test_events
mv data/100_clusters/events/VI.nyl..HH.D.2016.348.tfrecords ../test_events
mv data/100_clusters/events/VI.vos..HH.D.2015.317.tfrecords ../test_events
mv data/100_clusters/events/VI.nyl..HH.D.2015.247.tfrecords ../test_events
mkdir output
mkdir convnetquake
mv data/noise_OK029/noise_august/noise_GSOK029_8-2014_16.tfrecords data/100_clusters/test_noise
mv data/noise_OK029/noise_august/noise_GSOK029_8-2014_56.tfrecords data/100_clusters/test_noise
mv data/noise_OK029/noise_august/noise_GSOK029_8-2014_95.tfrecords data/100_clusters/test_noise
mv data/noise_OK029/noise_august/noise_GSOK029_8-2014_102.tfrecords data/100_clusters/test_noise
mv data/noise_OK029/noise_august/noise_GSOK029_8-2014_115.tfrecords data/100_clusters/test_noise
mv data/noise_OK029/noise_august/noise_GSOK029_8-2014_39.tfrecords data/100_clusters/test_noise
export LC_ALL=C
./bin/train --dataset data/100_clusters/train --checkpoint_dir output/convnetquake --n_clusters 100
# ./bin/evaluate --checkpoint_dir output/convnetquake/ConvNetQuake --dataset data/100_clusters/test_events --eval_interval 10 --n_clusters 100 --events & ./bin/evaluate --checkpoint_dir output/convnetquake/ConvNetQuake --dataset data/100_clusters/test_noise --eval_interval 10 --n_clusters 100 --noise
