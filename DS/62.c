#include<stdio.h>
#include<stdlib.h>

struct node{
	int info;
	struct node *link;
};

struct node* first = NULL;

void push(int x){
	struct node *new;
	new=(struct node*) malloc(sizeof(struct node));
	
	if(new == NULL){
		printf("Stack Overflow...!");
		return;
	}
	new->info = x;
	if(first == NULL){
		new->link = NULL;
		first = new;
		return;	
	}
	new->link = first;
	first = new;
}
void pop(){
	if(first == NULL){
		printf("Linked list Empty...!\n");
		return;
	}
	struct node *save = first;
	first = save->link;
	printf("Poped node: %d\n",save->info);
	free(save);
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
	push(10);
	push(20);
	push(30);
	push(40);
	push(50);
	display();
	pop();
	pop();
	display();
}
