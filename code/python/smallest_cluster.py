#!/usr/bin/python
from sklearn import cluster
from utils import *
import json

def get_cluster_distribution(cluster_labels, n_clusters=8):
	return [sum(i==cluster_labels) for i in range(n_clusters)]

def main(features=[], algorithm="KMeans", param=dict()):
	nc = 1
	(X,Y) = load(features)

	X = normalize(X)

	cluster_obj = getattr(cluster, algorithm)(**param)
	cluster_labels = cluster_obj.fit_predict(X)

	dist = get_cluster_distribution(cluster_labels, n_clusters=param["n_clusters"])
	ord_dist = sorted(dist)
	print ord_dist
	for i in range(nc):
		print "\n cluster %s" % i
		index = dist.index(ord_dist[i])
		smallest = Y[cluster_labels==index]
		for i in smallest:
			print i
if __name__ == '__main__':
	main()
	args = json.load(file("config.json"))
	main(**args)

