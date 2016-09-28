from utils import *
import json

from mpl_toolkits.mplot3d import Axes3D
import matplotlib.pyplot as plt

def main(features, log_id):
    (X,Y) = load(features, log_id)

    norm_X = normalize(X)
    if len(features) == 3:
        fig = plt.figure()
        fig.canvas.set_window_title("Projecao 3d")
        ax = fig.add_subplot(111, projection='3d')
        text = ax.text(0.05, 0.95, 9.0, 'IP:\n%s:\n%s:\n%s:' % (features[0],features[1],features[2]),
                        transform=ax.transAxes, va='top')

        ax.plot(norm_X[:,0],norm_X[:,1], norm_X[:,2], "bo", picker=5)
        ax.set_xlabel(features[0])
        ax.set_ylabel(features[1])
        ax.set_zlabel(features[2])
        
        def onpick(event):
            thisline = event.artist
            xdata = thisline.get_xdata()
            ydata = thisline.get_ydata()
            ind = event.ind
            points = tuple(zip(xdata[ind], ydata[ind]))
            IP = Y[ind]
            text.set_text("IP: %s\n%s: %s\n%s: %s\n%s: %s" % (IP[0], features[0], X[ind, 0][0],features[1], X[ind, 1][0], features[2], X[ind, 2][0]))
            print('onpick points:', points, IP)
            fig.canvas.draw()

        fig.canvas.mpl_connect('pick_event', onpick)

    else:
        fig = plt.figure()
        fig.canvas.set_window_title("Projecao 2d")
        splt = fig.add_subplot(111, xlabel=features[0], ylabel=features[1])
        splt.plot(norm_X[:,0],norm_X[:,1], "bo", picker=5)

        text = splt.text(0.05, 0.95, 'IP:\n%s:\n%s:' % (features[0], features[1]),
                        transform=splt.transAxes, va='top')

        def onpick(event):
            thisline = event.artist
            xdata = thisline.get_xdata()
            ydata = thisline.get_ydata()
            ind = event.ind
            points = tuple(zip(xdata[ind], ydata[ind]))
            IP = Y[ind]
            text.set_text("IP: %s\n%s: %s\n%s: %s" % (IP[0], features[0], X[ind, 0][0],features[1], X[ind, 1][0]))
            print('onpick points:', points, IP)
            fig.canvas.draw()

        fig.canvas.mpl_connect('pick_event', onpick)

    plt.show()


if __name__ == '__main__':
    import argparse
    parser = argparse.ArgumentParser(description="Plots 2d from DB")
    parser.add_argument('log_id_path', type=str, nargs=1,help='Path to log_id file')
    parser.add_argument('axis', type=str, nargs='+', help="Features be analyzed")

    args = parser.parse_args()

    log_id = str(json.load(file(args.log_id_path[0]))["log_id"])

    if len(args.axis) not in [2,3]:
        print "Enter two or three arguments"
    else:
        main(args.axis, log_id)