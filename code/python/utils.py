#!/usr/bin/python
import psycopg2
import numpy as np

def load():
	conn_string = "host='localhost' dbname='botnets_pfc'"
	# print the connection string we will use to connect
	print "Connecting to database\n	->%s" % (conn_string)

	# get a connection, if a connect cannot be made an exception will be raised here
	conn = psycopg2.connect(conn_string)

	# conn.cursor will return a cursor object, you can use this cursor to perform queries
	cursor = conn.cursor()

	# execute our Query
	cursor.execute( "SELECT client_ip, "
					"count_domain_with_numbers, "
					"average_domain_length, "
					"std_domain_length, "
					"count_request, "
					"average_requisition_degree, "
					"minimum_requisition_degree "
					"FROM clients")

	dataset = np.array(cursor.fetchall())
	ids = dataset[:,0]
	dataset = np.array(dataset[:,1:], dtype=np.float64)
	# retrieve the records from the database
 
	return (dataset, ids)


def shuffle_dataset(dataset, ids):
	# np.random.seed(1234)
	p = np.random.permutation(ids.shape[0])
	return (dataset[p], ids[p])

def separate_dataset(dataset, ids, rate=(0.8,0.2), validation=False):
	
	if sum(rate)!=1:
		raise Exception("Rate argument must sum up to 1")
	if (validation and len(rate) > 3) or ((not validation) and len(rate) > 2):
		raise Exception("Too many rate arguments")
	elif validation and len(rate) < 3:
		raise Exception("You must set the validation size rate")
	elif (not validation) and len(rate) < 2:
		raise Exception("You must set the test size rate")

	train_idx = int(rate[0]*ids.shape[0])
	test_idx = int((rate[0] + rate[1]) * ids.shape[0])
	
	Y_train = ids[:train_idx]
	Y_test = ids[train_idx:test_idx]
	
	X_train = dataset[:train_idx]
	X_test = dataset[train_idx:test_idx]
	if validation:
		Y_val = ids[test_idx:]
		X_val = dataset[test_idx:]
		return (X_train, Y_train, X_test, Y_test, X_val, Y_val)

	return (X_train, Y_train, X_test, Y_test)


def normalize(X):
	return (X-np.mean(X,axis=0))/np.std(X,axis=0)

