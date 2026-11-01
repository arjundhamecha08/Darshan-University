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

struct node* reverse(int count){
    if(first == NULL){
        printf("Linked List is empty");
        return first;
    }

    struct node *prev = NULL;
    struct node *current = first;
    struct node *next = NULL;

    while(current != NULL){
        next = current->link;
        current->link = prev;
        prev = current;
        current = next;
    }

    first = prev;

    return first;
}

void display_reverse(){
    struct node *save = first;

    while(save != NULL){
        printf("%d -> ", save->info);
        save = save->link;
    }

    printf("NULL\n");
}

int main(){
    insert_end(10);
    insert_end(20);
    insert_end(30);
    insert_end(40);
    insert_end(50);

    printf("Original Linked List:\n");
    display_reverse();

    reverse(5);

    printf("Reversed Linked List:\n");
    display_reverse();

    return 0;
}