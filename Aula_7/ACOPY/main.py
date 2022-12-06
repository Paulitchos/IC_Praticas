import math

import numpy as np
import acopy
import tsplib95

solver = acopy.Solver(rho=.03, q=1)
colony = acopy.Colony(alpha=1, beta=3)

problem = tsplib95.load('bayg29.tsp')
G = problem.get_graph()

#Solving - 100 iterations with a default number of ants:
tour = solver.solve(G, colony, limit=100)
print(tour.cost)
tour.nodes
tour.path

elite = acopy.plugins.EliteTracer(factor=2)
tour = solver.solve(G, colony, limit=100)
tour.cost
print(tour.cost)


