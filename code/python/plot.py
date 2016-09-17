from utils import *

from mpl_toolkits.mplot3d import Axes3D
import matplotlib.pyplot as plt

def main(features):
    (X,Y) = load(features)

    X = normalize(X)
    if len(features) == 3:
        fig = plt.figure()
        fig.canvas.set_window_title("Projecao 3d")
        ax = fig.add_subplot(111, projection='3d')

        ax.plot(X[:,0],X[:,1], X[:,2], "bo")
        ax.set_xlabel(features[0])
        ax.set_ylabel(features[1])
        ax.set_zlabel(features[2])

    else:
        fig = plt.figure()
        fig.canvas.set_window_title("Projecao 2d")
        splt = fig.add_subplot(111, xlabel=features[0], ylabel=features[1])
        splt.plot(X[:,0],X[:,1], "bo")
    plt.show()

if __name__ == '__main__':
    import argparse
    parser = argparse.ArgumentParser(description="Plots 2d from DB")
    parser.add_argument('axis', type=str, nargs='+', help="Features be analyzed")

    args = parser.parse_args()
    if len(args.axis) not in [2,3]:
        print "Enter two or three arguments"
    else:
        main(args.axis)