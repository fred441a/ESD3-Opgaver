#include <stdio.h>
#include <stdlib.h>

// Define a struct to represent items
struct Item {
    int length;
    int price;
};

// Function to calculate the price-to-length ratio for an item
double calculateRatio(const struct Item *item) {
    return (double)item->price / item->length;
}

// Function to compare two items based on their ratio (for qsort)
int compareItems(const void *a, const void *b) {
    const struct Item *item1 = (const struct Item *)a;
    const struct Item *item2 = (const struct Item *)b;
    double ratio1 = calculateRatio(item1);
    double ratio2 = calculateRatio(item2);

    if (ratio1 > ratio2) {
        return -1; // Return negative value for descending order
    } else if (ratio1 < ratio2) {
        return 1; // Return positive value for descending order
    } else {
        return 0; // Ratios are equal
    }
}

// Function to sort items in descending order by ratio
void sortItemsByRatio(struct Item items[], int n) {
    qsort(items, n, sizeof(struct Item), compareItems);
}

// Function to find the maximum price combination using a greedy algorithm
int maxPriceCombination(struct Item items[], int n, int size) {
    for (int i = 0; i < n; i++) {
        if (size >= items[i].length) {
            printf("price: %i, length: %i, remaning: %i\n", items[i].price, items[i].length, size - items[i].length);
            return items[i].price + maxPriceCombination(items, n, size - items[i].length);
        }
    }

    return 0;
}

int main(void) {
    // Sample input data
    struct Item items[10] = {
        {1, 1},
        {2, 5},
        {3, 8},
        {4, 9},
        {5, 10},
        {6, 17},
        {7, 17},
        {8, 20},
        {9, 24},
        {10, 30}
    };

    int n = 10; // Number of items
    int size = 15; // Size constraint

    sortItemsByRatio(items, n);
    int result = maxPriceCombination(items, n, size);
    printf("Maximum price for the given size: %d\n", result);

    return 0;
}
