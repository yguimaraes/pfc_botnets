#!/usr/bin/python
import psycopg2
import numpy as np

def load(features):
	conn_string = "host='localhost' dbname='botnets_pfc'"
	# print the connection string we will use to connect
	print "Connecting to database\n	->%s" % (conn_string)

	# get a connection, if a connect cannot be made an exception will be raised here
	conn = psycopg2.connect(conn_string)

	# conn.cursor will return a cursor object, you can use this cursor to perform queries
	cursor = conn.cursor()

	# execute our Query
	cursor.execute( "SELECT client_ip, " + str.join(", ", features) + " FROM clients")

	dataset = np.array(cursor.fetchall())
	ids = dataset[:,0]
	dataset = np.array(dataset[:,1:], dtype=np.float64)
	# retrieve the records from the database
	return (dataset, ids)


def normalize(X):
	return (X-np.mean(X,axis=0))/(np.max(X,axis=0)-np.min(X,axis=0))
