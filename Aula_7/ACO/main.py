import math

from aco import ACO, Graph
from plot import plot
import numpy as np


def distance(city1: dict, city2: dict):
    return math.sqrt((city1['x'] - city2['x']) ** 2 + (city1['y'] - city2['y']) ** 2)


def main():
    
    cities = []
    points = []
    with open('./data/chn31.txt') as f:
        for line in f.readlines():
            city = line.split(' ')
            cities.append(dict(index=int(city[0]), x=int(city[1]), y=int(city[2])))
            points.append((int(city[1]), int(city[2])))
    cost_matrix = []
    rank = len(cities)
    for i in range(rank):
        row = []
        for j in range(rank):
            row.append(distance(cities[i], cities[j]))
        cost_matrix.append(row)

    values = np.array([])
    mean = 0
    desvioPadrao = 0
    for i in range(30):
        aco = ACO(10, 100, 1.0, 10.0, 0.5, 10, 2)
        graph = Graph(cost_matrix, rank)
        path, cost = aco.solve(graph)
        values=np.append(values,cost)
        print('cost: {}, path: {}'.format(cost, path))
        
    mean = values.mean()
    desvioPadrao = values.std()

    print('\n Average cost: {}, (standard deviation: {})'.format(mean,desvioPadrao))
    plot(points, path)

if __name__ == '__main__':
    main()
