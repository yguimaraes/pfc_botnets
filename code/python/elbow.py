import matplotlib.pyplot as plt

fig = plt.figure()
ax = fig.add_subplot(111)

t = range(1,10)

s = [500.0/(i**2) for i in range(1,10)]

line, = ax.plot(t, s)

ax.annotate('cotovelo', xy=(3*1.03,500.0/(3**2)*1.03), xytext=(4, 100),
            arrowprops=dict(facecolor='black', shrink=0.05),
            )

plt.plot(3,500.0/(3**2),"ko")
ax.set_xlim(0,10)
ax.set_ylim(0, 550)
plt.show()
