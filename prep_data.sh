mkdir data
mkdir data/catalogs
cd data/catalogs
wget https://www.dropbox.com/sh/3p9rmi1bcpvnk5k/AAC_1lEoII2y64j92dKjLBBSa/catalogs/Benz_catalog.csv
wget https://www.dropbox.com/sh/3p9rmi1bcpvnk5k/AACU5NxcaiBfD8cqOzK7pctWa/catalogs/OK_2014-2015-2016.csv
cd ..
cd ..
sudo ./bin/preprocess/cluster_events --src data/catalogs/OK_2014-2015-2016.csv --dst data/6_clusters --n_components 6 --model KMeans
sudo ./bin/preprocess/create_dataset_events.py --stream_dir data/streams --catalog data/6_clusters/catalog_with_cluster_ids.csv --output_dir data/6_clusters/events --save_mseed True --plot True
