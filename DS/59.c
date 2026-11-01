#include<stdio.h>
#include<stdlib.h>

struct node{
    int info;
    struct node *link;
};

struct node* first = NULL;

void insert_end(int x){
    struct node *new;
    new = (struct node*) malloc(sizeof(struct node));
    new->info = x;

    if(first == NULL){
        new->link = NULL;
        first = new;
        return;
    }

    struct node *save = first;

    while(save->link != NULL){
        save = save->link;
    }

    save->link = new;
    new->link = NULL;
}

int count(){
    int count = 0;

    struct node *save = first;

    while(save != NULL){
        count++;
        save = save->link;
    }

    return count;
}

void swapping(int k){
    int n = count();
    int i;

    if(first == NULL || k <= 0 || k > n){
        printf("Cannot Swap!\n");
        return;
    }

    if(2*k-1 == n){
        printf("Both nodes are same. No swapping required!\n");
        return;
    }

    struct node *x = first;
    struct node *x_prev = NULL;

    for(i=0; i<k-1; i++){
        x_prev = x;
        x = x->link;
    }

    struct node *y = first;
    struct node *y_prev = NULL;

    for(i=0; i<n-k; i++){
        y_prev = y;
        y = y->link;
    }

    // If x is not the first node
    if(x_prev != NULL)
        x_prev->link = y;
    else
        first = y;

    // If y is not the first node
    if(y_prev != NULL)
        y_prev->link = x;
    else
        first = x;

    // Swap links
    struct node *temp = x->link;
    x->link = y->link;
    y->link = temp;
}

void display(){
    if(first == NULL){
        printf("Linked list empty...\n");
        return;
    }

    struct node *save = first;

    while(save != NULL){
        printf("%d\t", save->info);
        save = save->link;
    }

    printf("\n");
}

int main(){
    insert_end(10);
    insert_end(20);
    insert_end(30);
    insert_end(40);
    insert_end(50);

    printf("Original Linked List:\n");
    display();

    swapping(2);

    printf("After Swapping:\n");
    display();

    return 0;
}