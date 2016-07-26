from utils import *
import matplotlib.pyplot as plt
from sklearn import cluster

def main():
	n_tests = 10
	(X,Y) = load()
	X = normalize(X)
	cost = [0.0]
	for i in range(1,12):
		cost_exp = []
		for j in range(n_tests):
			# (X,Y) = shuffle_dataset(X, Y)
			# (X_train, Y_train, X_test, Y_test) = separate_dataset(X, Y)
			mKmeans = cluster.KMeans(n_clusters=i)
			mKmeans.fit(X)
			cost_exp.append(mKmeans.score(X))
		cost.append(sum(cost_exp)/n_tests)
	plt.plot(cost)
	plt.ylabel("Cost")
	plt.xlabel("n_labels")
	plt.show()


if __name__ == '__main__':
	main()