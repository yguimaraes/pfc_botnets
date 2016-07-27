#!/usr/bin/env python
"""
Illustrate simple contour plotting, contours on an image with
a colorbar for the contours, and labelled contours.

See also contour_image.py.
"""
import matplotlib
import numpy as np
import matplotlib.cm as cm
import matplotlib.mlab as mlab
import matplotlib.pyplot as plt
from sklearn import cluster


matplotlib.rcParams['xtick.direction'] = 'out'
matplotlib.rcParams['ytick.direction'] = 'out'

# delta = 0.025
# x = np.arange(-5.0, 9.0, delta)
# y = np.arange(-4.0, 6.0, delta)
# X, Y = np.meshgrid(x, y)

rot = np.array([[np.cos(np.pi*6/9),-np.sin(np.pi*6/9)],[np.sin(np.pi*6/9),np.cos(np.pi*6/9)]])
std = np.array([[2,1]])
trans1 = np.array([[5,10]])

# trans2 = np.array([[2],[2]])

coord = np.dot(np.random.randn(1000,2) * std,rot) + trans1
# coord2 = np.dot(rot, np.random.randn(2,1000) * std) + trans2

km = cluster.KMeans(n_clusters=2)

labels = km.fit_predict(coord)

coord1 = coord[labels==0,:]
coord2 = coord[labels==1,:]

print coord2.shape
print coord1.shape

cent1 = np.mean(coord1, axis=0)
cent2 = np.mean(coord2, axis=0)

# Z1 = mlab.bivariate_normal(X, Y, 1.0, 1.0, 0.0, 0.0)
# Z2 = mlab.bivariate_normal(X, Y, 1.5, 0.5, 1, 1)
# # difference of Gaussians
# Z = 10.0 * (Z2 - Z1)

# Z = mlab.bivariate_normal(X, Y, np.std(coord[0]), np.std(coord[1]), np.mean(coord[0]), np.mean(coord[1]), np.cos(np.pi/9))

# Create a simple contour plot with labels using default colors.  The
# inline argument to clabel will control whether the labels are draw
# over the line segments of the contour, removing the lines beneath
# the label
plt.figure()
# CS = plt.contour(X, Y, Z, 5, levels=[0.0003,0.001,0.003,0.01,0.03], colors='k')
# plt.axis([-5,9,-4,6])
plt.plot(coord1[:,0],coord1[:,1], "kx")
plt.plot(coord2[:,0],coord2[:,1], "ws")
plt.plot(cent1[0],cent1[1], "ko")
plt.plot(cent2[0],cent2[1], "ko")
# plt.clabel(CS, inline=1, fontsize=10, fmt="%1.4f", manual=True)


plt.show()
