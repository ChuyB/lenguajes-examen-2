import time
import matplotlib.pyplot as plt
from numpy import linspace


def f_recursive(n):
    if 0 <= n < 35:
        return n
    elif n >= 35:
        res = 0
        for i in range(1, 8):
            res = res + f_recursive(n - 5 * i)
        return res
    return 0


def f_tail_h(n, acc=0):
    if 0 <= n < 35:
        return acc + n
    elif n >= 35:
        return f_tail_h(n - 5, acc)
    return acc


def f_tail(n):
    return f_tail_h(n, 0)


def f_iter(n):
    acc = 0
    while n >= 35:
        acc += n
        n -= 5
    return acc + n if 0 <= n < 35 else acc


def getFTime(f, n):
    start = time.time()
    f(n)
    end = time.time()
    return end - start


fig, (ax1, ax2) = plt.subplots(2)

fig.suptitle("Versiones iterativas y recursivas")
x1 = list(range(0, 5000, 1))
x2 = list(range(0, 130, 1))
y1 = [getFTime(f_iter, n) for n in x1]
y2 = [getFTime(f_tail, n) for n in x1]
y3 = [getFTime(f_recursive, n) for n in x2]

ax1.plot(x1, y1, "r")
ax1.plot(x1, y2, "g")
ax1.set_title("Iterativa y recursiva de cola")
ax2.plot(x2, y3, "b")
ax2.set_title("Recursiva")
plt.show()
