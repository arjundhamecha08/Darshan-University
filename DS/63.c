#include<stdio.h>
#include<stdlib.h>

struct node{
	int info;
	struct node *link;
};

	struct node* first = NULL;
	struct node* rear = NULL;

void enqueue(int x){
	struct node *new;
	new=(struct node*) malloc(sizeof(struct node));
	new->info = x;
	
	if(rear == NULL){
		new->link = NULL;
		first = new;
		rear = new;
		return;	
	}
	
	rear->link = new;
	rear = new;
}
void dequque(){
	if(first == NULL){
		printf("Queue is Empty...!");
		return;
	}
	struct node *save = first;
	printf("Dequeued Node: %d\n",save->info);
	first=save->link;
	free(save);
}

void c_equeue(int x){
	
	struct node *new;
	new=(struct node*) malloc(sizeof(struct node));
	new->info = x;
	
	if(rear == NULL){
		first = new;
		rear = new;
		rear->link = first;
	}
	new->link = first;
	rear->link = new;
	rear = new;
}
void c_dequeue(){
	if(first == NULL){
		printf("Queue is Empty...!");
		return;
	}
	struct node *save = first;
	printf("Dequeued Node: %d\n",save->info);
	first=save->link;
	rear->link = first;
	free(save);
}

void display(){
	
	if(first == NULL){
		printf("Linked list empty...\n");
	}
	struct node *save = first;
	while(save != rear){
		printf("%d\t",save->info);
		save = save->link;
	}
	printf("%d\t",save->info);
	printf("%d\t",save->link->info);
	printf("\n");
}
void main(){
//	enqueue(10);
//	enqueue(20);
//	enqueue(30);
//	enqueue(40);
//	enqueue(50);
	c_equeue(60);
	display();
	c_dequeue();
//	display();
}

