#include<stdio.h>
#include<stdlib.h>

struct node{
	int info;
	struct node *link;
};

struct node* first = NULL;

void insert_end(int x){
	struct node *new;
	new=(struct node*) malloc(sizeof(struct node));
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
void removeDuplicate(struct node* first){
	struct node* save = first;
	
	while(save!=NULL && save->link != NULL){
		if(save->info == save->link->info){
			save->link = save->link->link;
		}
		else{
			save = save->link;
		}
	}
}

void display(){
	
	if(first == NULL){
		printf("Linked list empty...\n");
	}
	struct node *save = first;
	while(save != NULL){
		printf("%d\t",save->info);
		save = save->link;
	}
	printf("\n");
	
}

void main(){
	insert_end(1);
	insert_end(1);
	insert_end(6);
	insert_end(13);
	insert_end(13);
	insert_end(13);
	insert_end(27);
	insert_end(27);
	printf("Original Linked List: \n");
	display();
	removeDuplicate(first);
	printf("After Removing Duplicate Elements: \n");
	display();
}

