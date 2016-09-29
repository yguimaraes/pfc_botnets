#!/usr/bin/python
from sklearn import cluster
from utils import *
import json
import xlwt

def get_cluster_distribution(cluster_labels, n_clusters=8):
	return [sum(i==cluster_labels) for i in range(n_clusters)]

def get_ips(features=[], algorithm="KMeans", param=dict(), log_id=0):
	(X,Y) = load(features, log_id)

	X_norm = normalize(X)

	if algorithm == "AgglomerativeClustering":
		param["memory"] = "./.cache"
		param["compute_full_tree"] = False
	cluster_obj = getattr(cluster, algorithm)(**param)
	cluster_labels = cluster_obj.fit_predict(X_norm)

	dist = get_cluster_distribution(cluster_labels, n_clusters=param["n_clusters"])
	ord_dist = sorted(dist)
	print ord_dist
	IPs = {}
	Coor = {}
	for i in range(param["n_clusters"]):
		# print "\n cluster %s" % i
		index = dist.index(ord_dist[i])
		IPs[i] = Y[cluster_labels==index]
		Coor[i] = X[cluster_labels==index]
	return IPs, Coor

def export_sheet(IPs, Coor, labels, output):
	wb = xlwt.Workbook()
	
	header = ["IP"]
	header.extend(labels)
	style = xlwt.easyxf('font: bold on;')
	for cl_ind in range(len(Coor)):
		ws = wb.add_sheet('Grupo %d' % (cl_ind+1))
		for f_ind in range((Coor[cl_ind].shape)[1]+1):
			ws.write(0,f_ind,header[f_ind],style)

			for ip_ind in range((Coor[cl_ind].shape)[0]):

				if f_ind:
					ws.write(ip_ind+1,f_ind,float(Coor[cl_ind][ip_ind][f_ind-1]))
				else:
					ws.write(ip_ind+1,f_ind,IPs[cl_ind][ip_ind])
	print "salvando " + output
	wb.save(output)

if __name__ == '__main__':
	import argparse
	parser = argparse.ArgumentParser(description='Clusters IP address from PostgreSql')
	parser.add_argument('config_path', type=str, nargs=1,help='Path to configuration file')
	parser.add_argument('log_id_path', type=str, nargs=1,help='Path to log_id file')
	parser.add_argument('output_path', type=str, nargs=1,help='Path to output target')

	args = parser.parse_args()

	config = json.load(file(args.config_path[0]))
	log_id = str(json.load(file(args.log_id_path[0]))["log_id"])
	output = args.output_path[0]

	IPs, Coor = get_ips(log_id=log_id, **config)
	export_sheet(IPs, Coor, config["features"], output)