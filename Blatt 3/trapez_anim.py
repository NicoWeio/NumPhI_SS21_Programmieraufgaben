import numpy as np
import matplotlib.pyplot as plt
from matplotlib import animation

def f(x):
    return np.sin(5*np.pi*x)

x_linspace = np.linspace(0, 1, 10000)

def single_triang(N, n):
    lower = (n-1) / N
    upper = n     / N
    points = [[lower, f(lower)], [upper, f(upper)], [upper, 0], [lower, 0]]
    x_y = list(zip(*points))
    return x_y

def triag(N, color):
    for n in range(1, N+1):
        print(f"{n=}")
        plt.fill(*single_triang(N, n), alpha=0.5, color=color)

def animate(i):
    plt.clf()
    plt.plot(x_linspace, f(x_linspace))
    plt.title(f"N={i+1}")
    triag(i+1, 'red')

fig = plt.figure()
anim = animation.FuncAnimation(fig, animate, init_func=init, frames=15, interval=1000)
# anim.save('trapez_anim.mp4', fps=1, extra_args=['-vcodec', 'libx264'])
plt.show()
