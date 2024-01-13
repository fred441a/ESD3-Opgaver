#include <stdio.h>
typedef struct {
    int val;
    struct node* next;
    struct node* prev;
} node;

node root = {
    .val = 0,
    .prev = NULL,
    .next = &n1,
};

node n1 = {
    .val = 1,
    .prev = &root,
    .next = &n2,
};

node n2 = {
    .val = 2,
    .prev = &n1,
    .next = &n3,
};
node n3 = {
    .val = 3,
    .prev = &n2,
    .next = &n4,
};

node n4 = {
    .val = 5,
    .prev = &n3,
    .next = &n5,
};

node n5 = {
    .val = 6,
    .prev = &n4,
    .next = &n6,
};

node n6 = {
    .val = 7,
    .prev = &n5,
    .next = &n7,
};

node n7 = {
    .val = 6,
    .prev = &n6,
    .next = NULL,
};

void findMissing(node *root){
    if (root->next == NULL)
        return;
    
    node* current = root->next;

    do {
        int prevVal = current->prev->val;
        int currentVal = current->val;
    
        if(currentVal - prevVal > 1)
            printf("missing: %i - %i", prevVal, currentVal);

        current = current->next;
    } while(current != NULL);
}

void main(){
    findMissing(&root);
}

