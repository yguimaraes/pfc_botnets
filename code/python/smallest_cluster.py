#!/usr/bin/python
from sklearn import cluster
from utils import *
import json

def get_cluster_distribution(cluster_labels, n_clusters=8):
	return [sum(i==cluster_labels) for i in range(n_clusters)]

def main():
	nc = 4

	(X,Y) = load()
	# (X,Y) = shuffle_dataset(X, Y)
	# (X_train, Y_train, X_test, Y_test) = separate_dataset(X, Y)
	X = normalize(X)
	mKmeans = cluster.KMeans(n_clusters=nc, 
							 init='k-means++', 
							 n_init=10, 
							 max_iter=300, 
							 tol=0.0001, 
							 precompute_distances='auto', 
							 verbose=0, 
							 random_state=None, 
							 copy_x=True, 
							 n_jobs=1)
	
	cluster_labels = mKmeans.fit_predict(X)
	dist = get_cluster_distribution(cluster_labels, n_clusters=nc)
	index = dist.index(min(dist))
	smallest = Y[cluster_labels==index]
	print dist
	for i in smallest:
		print i


if __name__ == '__main__':
	main()
	import argparse
	parser = argparse.ArgumentParser(description='Clusters IP address from PostgreSql')
	parser.add_argument('config_path', type=str, nargs=1,help='Path to configuration file')
	parser.add_argument('log_id_path', type=str, nargs=1,help='Path to log_id file')
	parser.add_argument('output_path', type=str, nargs=1,help='Path to output target')

	args = parser.parse_args()

	config = json.load(file(args.config_path[0]))
	log_id = str(json.load(file(args.log_id_path[0]))["log_id"])
	output = args.output_path[0]
