# reciep for run mai 2018

# running kmeans ++, random centroids
./bin/preprocess/cluster_events --src data/catalogs/OK_2014-2015-2016.csv --dst data/75_clusters --n_components 75 --model KMeans
# result --> /home/kjartan/Documents/Workspace/research/ConvNetQuake/data/100_clusters/cluster_ids_100_comp.eps
# Number of events to cluster:  13858
#  + Calculating the distance matrix
#  + Running KMeans
# number of events 0
./bin/preprocess/create_dataset_events.py --stream_dir data/streams/data --catalog data/100_clusters/catalog_with_cluster_ids.csv --output_dir data/100_clusters/events --save_mseed True --plot True
