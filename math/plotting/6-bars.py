#!/usr/bin/env python3
"""Plot stacked bar graph of fruit per person."""
import numpy as np
import matplotlib.pyplot as plt

np.random.seed(5)
fruit = np.random.randint(0, 20, (4, 3))

people = ['Farrah', 'Fred', 'Felicia']
fruits = ['apples', 'bananas', 'oranges', 'peaches']
colors = ['red', 'yellow', '#ff8000', '#ffe5b4']

plt.bar(people, fruit[0], 0.5, label=fruits[0], color=colors[0])
bottom = fruit[0]
for i in range(1, 4):
    plt.bar(people, fruit[i], 0.5, bottom=bottom,
            label=fruits[i], color=colors[i])
    bottom += fruit[i]

plt.ylabel('Quantity of Fruit')
plt.ylim(0, 80)
plt.yticks(range(0, 81, 10))
plt.title('Number of Fruit per Person')
plt.legend()
plt.show()
