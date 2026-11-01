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

void sort(){
    struct node *save, *temp;
    int t;

    for(save = first; save != NULL; save = save->link){
        for(temp = save->link; temp != NULL; temp = temp->link){

            if(save->info > temp->info){
                t = save->info;
                save->info = temp->info;
                temp->info = t;
            }
        }
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
    insert_end(40);
    insert_end(10);
    insert_end(50);
    insert_end(20);
    insert_end(30);

    printf("Before Sorting:\n");
    display();

    sort();

    printf("After Sorting:\n");
    display();

    return 0;
}