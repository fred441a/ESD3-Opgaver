#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include "QuickSort.h"
#include "Heapsort.h"
#include "CountingSort.h"

void testArray(int arraySize, void (*testFunc)(int*,int)){
		int sortedArray[arraySize];
		int reverseSortedArray[arraySize];
		int randomArray[arraySize];

		for(int i=0; i < arraySize; i++){
				sortedArray[i] = i;
				reverseSortedArray[i] = arraySize-i;
				randomArray[i] = rand();
		}

		unsigned long time; 

		time = clock();
		testFunc(sortedArray,arraySize);
		printf("sorted array: %f\n",time-clock()/(double)CLOCKS_PER_SEC);
		time = clock();

		time = clock();
		testFunc(reverseSortedArray,arraySize);
		printf("reversed array: %f\n",time-clock()/(double)CLOCKS_PER_SEC);
		time = clock();

		time = clock();
		testFunc(randomArray,arraySize);
		printf("random array: %f\n",time-clock()/(double)CLOCKS_PER_SEC);
		time = clock();

}

int main(){

		printf("100\n");
		testArray(100,RealQuickSort);
		testArray(100,heapSort);
		testArray(100,CountingSort);
		printf("1000\n");
		testArray(1000,RealQuickSort);
		testArray(1000,heapSort);
		testArray(1000,CountingSort);
		printf("10000\n");
		testArray(10000,RealQuickSort);
		testArray(10000,heapSort);
		testArray(10000,CountingSort);
    	printf("100000\n");
		testArray(100000,RealQuickSort);
		testArray(100000,heapSort);
		testArray(100000,CountingSort);	
		return 0;
}
