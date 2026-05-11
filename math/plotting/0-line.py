#!/usr/bin/env python3
"""Plot y as a line graph."""
import numpy as np
import matplotlib.pyplot as plt

y = np.arange(0, 11) ** 3

# your code here
plt.plot(y, 'r-')  # red solid line
plt.xlim(0, 10)    # x-axis from 0 to 10
plt.show()
