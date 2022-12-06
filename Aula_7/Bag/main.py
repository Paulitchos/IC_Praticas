from antsys import AntWorld
from antsys import AntSystem
import numpy as np
import random

#generate and show knapsack capacity
max_weight = 35 #random.randint(200,500)

print('knapsack max weight = ',max_weight)

#generate and show available items
print('\navailable items:')
print('|Item | Weight | Value |')
#items=[]

#for i in range(10):
#items.append((i,random.randint(50,200),random.randint(100,500)))
#print('|%4i|%6i|' % items[i])

items = [
    (1,11,5),
    (2,18,8),
    (3,12,7),
    (4,14,6),
    (5,13,9),
    (6,11,6),
    (7,10,5),
    (8,16,3)
]

for i in range(8):
    print('|%4i |%6i  |%6i |' % items[i])

def knapsack_rules(start, end):
  return [0, 1]

def knapsack_cost(path):
  k_value = 0
  k_weight = 0
  for edge in path:
    if edge.info == 1:
      k_value += edge.end[2]
      k_weight += edge.end[1]
  cost = 5/k_value+1/k_weight
  if k_weight > max_weight:
    cost += 1
  else:
    for edge in path:
      if edge.info == 0 and edge.end[1] <= (max_weight-k_weight):
        cost += 1
  return cost

def knapsack_heuristic(path, candidate):
  k_weight = 0
  for edge in path:
    if edge.info == 1:
      k_weight += edge.end[1]
  if candidate.info == 1 and candidate.end[1] < (max_weight-k_weight):
    return 0
  elif candidate.info == 0:
    return 1
  else:
    return 2

def print_solution(path):
  print('knapsack items:')
  print('|item|weight| value|')
  value = 0
  weight = 0
  for edge in path:
    if(edge.info == 1):
      print('|%4i|%6i|%6i|' % edge.end)
      value+=edge.end[2]
      weight+=edge.end[1]
  print('total weight = %g\ntotal value = %g' % (weight, value))

new_world = AntWorld(items, knapsack_rules, knapsack_cost, knapsack_heuristic, False)

ant_opt = AntSystem(world=new_world, n_ants=100)

ant_opt.optimize(50,20)

print('\nknapsack max weight =', max_weight)
print_solution(ant_opt.g_best[2])