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
				randomArray[i] = (rand()/RAND_MAX)*100;
		}

		unsigned long time; 

		time = clock();
		for(int i = 0; i < 100; i++){
		testFunc(sortedArray,arraySize);
		}
		printf("sorted array: %f\n",(time-clock()/100.0)/1000000);
		time = clock();
		
		time = clock();
		for(int i = 0; i < 100; i++){
		testFunc(reverseSortedArray,arraySize);
		}
		printf("reversed array: %f\n",(time-clock()/100.0)/1000000);
		time = clock();

		time = clock();
		for(int i = 0; i < 100; i++){
		testFunc(randomArray,arraySize);
		}
		printf("random array: %f\n",(time-clock()/100.0)/1000000);
		time = clock();

}

int main(){

		printf("100\n");
		printf("Quick sort \n");
		testArray(100,RealQuickSort);
		printf("Heap sort \n");
		testArray(100,heapSort);
		printf("Counting sort\n");
		testArray(100,CountingSort);
		printf("1000\n");
		printf("Quick sort \n");
		testArray(1000,RealQuickSort);
		printf("Heap sort \n");
		testArray(1000,heapSort);
		printf("Counting sort\n");
		testArray(1000,CountingSort);
		printf("10000\n");
		printf("Quick sort \n");
		testArray(10000,RealQuickSort);
		printf("Heap sort \n");
		testArray(10000,heapSort);
		printf("Counting sort\n");
		testArray(10000,CountingSort);
    	printf("100000\n");
		printf("Quick sort \n");
		testArray(100000,RealQuickSort);
		printf("Heap sort \n");
		testArray(100000,heapSort);
		printf("Counting sort\n");
		testArray(100000,CountingSort);	
		return 0;
}
