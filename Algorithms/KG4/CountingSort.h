#include <stdio.h>
#include <stdlib.h>

#define L 10

void CountingSort(int arr[], int len){
		//find max value in array
		unsigned long MAX = 0;
		for (int i = 0 ; i< len; i++){
				if(arr[i] > MAX){
						MAX=arr[i];
				}
		}
		MAX++;

		//make Counting Array
		int *CountingArray= (int*)malloc(MAX*sizeof(int));

		for(int i = 0; i < MAX; i++){
				CountingArray[i]=0;
		}

		//count how many times number is stored

    	for (int i = 0 ; i< len; i++){
				CountingArray[arr[i]]++;
		}

		// Do funky stuff to array
		for(int i = 1; i < MAX; i++){
				CountingArray[i] += CountingArray[i-1];
		}

		int *returnArray = (int*)malloc(len*sizeof(int));

		for(int i = 0; i < len; i++){
				returnArray[--CountingArray[arr[i]]] = arr[i];
		}
		free(CountingArray);
		free(returnArray);
	//	return returnArray;
}
