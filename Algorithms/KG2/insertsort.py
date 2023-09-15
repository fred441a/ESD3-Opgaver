import matplotlib.pyplot as plt
import numpy as np
import matplotlib as mlp
import random

def insert_sort (inputList):
    for j in range(1,len(inputList)):
        key = inputList[j]
        i = j -1 
        while i > 0 and inputList[i] > key:
            inputList[j] = inputList[i]
            i=i-1
            inputList[i+1] = key
    return inputList

def generate_random_list(n):
    return_list = []
    for i in range(n):
        return_list.append(random.random()*10)
    return return_list

time_list = []
for i in range(4):
    random_list = generate_random_list(4)





