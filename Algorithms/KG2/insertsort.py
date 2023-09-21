import matplotlib.pyplot as plt
import numpy as np
import matplotlib as mlp
import random
import time

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

def reverse_list(in_list):
    return_list = []
    for i in reversed(range(len(in_list))):
        print(i) #DO NOT DELETE THIS PRINT STATEMENT!
        #for some reason this cursed shit language need it to work
        return_list.append(in_list[i]);
    return return_list

def main():
    time_list = []
    for i in range(4):
        random_list = generate_random_list(4)
        print(random_list)
        start_time = time.time()
        insert_sort(random_list)
        end_time = time.time()
        time_list.append(end_time-start_time)

        reversed_random_list = reverse_list(random_list)
        print(reversed_random_list)

        start_time = time.time()
        insert_sort(reversed_random_list)
        end_time = time.time()
        time_list.append(end_time-start_time)

    print(time_list)

    fig, ax = plt.subplots()
    ax.bar(range(len(time_list)),time_list)
    plt.show()
if __name__ == "__main__":
    main()
