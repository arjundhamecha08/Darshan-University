#include<stdio.h>
#include<stdlib.h>

struct node{
    int info;
    struct node *link;
};

struct node* first = NULL;

void insert_end(int x){
    struct node *new;
    new = (struct node*)malloc(sizeof(struct node));
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

void swapping(){
    struct node *prev = NULL;
    struct node *current = first;
    struct node *next;

    while(current != NULL && current->link != NULL){

        next = current->link;

        current->link = next->link;
        next->link = current;

        if(prev == NULL){
            first = next;
        }
        else{
            prev->link = next;
        }

        prev = current;
        current = current->link;
    }
}

void display(){
    struct node *save = first;

    while(save != NULL){
        printf("%d -> ", save->info);
        save = save->link;
    }

    printf("NULL\n");
}

int main(){

    insert_end(1);
    insert_end(2);
    insert_end(3);
    insert_end(4);
    insert_end(5);
    insert_end(6);
    insert_end(7);
    insert_end(8);

    printf("Original Linked List:\n");
    display();

    swapping();

    printf("After Swapping:\n");
    display();

    return 0;
}