# gcloud compute scp --recurse /media/kjartan/DATADRIVE11/ConNetQuake/data/*  instance-convnetquake:/home/kjartan/ConvNetQuake/data --zone us-east1-c
# we want HHZ files from find /mseed/mseed/2013/ | grep -e nyl -e vog -e haf -e san -e grv -e kri -e vos | grep HH | awk -F '.' ' $8 >= 000 && $8 <= 345  { print $0 }' > filelist2013.txt
cd ~/ConvNetQuake
export PYTHONPATH=$PWD
./bin/preprocess/cluster_events --src data/catalogs/OK_2014-2015-2016.csv --dst data/6_clusters --n_components 6 --model KMeans
./bin/preprocess/create_dataset_events.py --stream_dir data/streams --catalog data/6_clusters/catalog_with_cluster_ids.csv --output_dir data/6_clusters/events --save_mseed True --plot True
./bin/preprocess/data_augmentation.py --tfrecords data/6_clusters/events --output data/6_clusters/augmented_data/augmented_stetch_std1-2.tfrecords --std_factor 1.2
./bin/preprocess/create_dataset_noise.py --stream_path data/streams/GSOK029_8-2014.mseed --catalog data/catalogs/Benz_catalog.csv --output_dir data/noise_OK029/noise_august --save_mseed True --plot True
mkdir ~/ConvNetQuake/data/6_clusters/train/
mkdir ~/ConvNetQuake/data/6_clusters/train/negative
mkdir ~/ConvNetQuake/data/6_clusters/train/positive
mkdir ~/ConvNetQuake/data/6_clusters/test_events
mkdir ~/ConvNetQuake/data/6_clusters/test_noise
cp -r data/noise_OK029/noise_august/* ~/ConvNetQuake/data/6_clusters/train/negative
cp -r ~/ConvNetQuake/data/6_clusters/events ~/ConvNetQuake/data/6_clusters/train/positive
cd ~/ConvNetQuake/data/6_clusters/events
mv GSOK029_9-2016.tfrecords ../test_events
mv GSOK029_8-2016.tfrecords ../test_events
mv GSOK029_7-2016.tfrecords ../test_events
cd ~/ConvNetQuake
mkdir ~/ConvNetQuake/output
mkdir ~/ConvNetQuake/convnetquake
cp -r data/noise_OK029/noise_august/* ~/ConvNetQuake/data/6_clusters/test_noise
export LC_ALL=C
./bin/train --dataset data/6_clusters/train --checkpoint_dir output/convnetquake --n_clusters 6
# ./bin/evaluate --checkpoint_dir output/convnetquake/ConvNetQuake --dataset data/6_clusters/test_events --eval_interval 10 --n_clusters 6 --events & ./bin/evaluate --checkpoint_dir output/convnetquake/ConvNetQuake --dataset data/6_clusters/test_noise --eval_interval 10 --n_clusters 6 --noise
