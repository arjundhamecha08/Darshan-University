#include<stdio.h>
#include<stdlib.h>

struct node{
	int info;
	int priority;
	struct node *link;
};

struct node* first = NULL;
struct node* rear = NULL;

void pq_enqueue(int x,int y){
	
	struct node *new;
	new=(struct node*) malloc(sizeof(struct node));
	new->info = x;
	new->priority = y;
	
	if(rear == NULL){
		new->link = NULL;
		first = new;
		rear = new;
		return;	
	}
	
	if(new->priority<=first->priority){
		new->link = first;
		first = new;
		return;
	}
	
	struct node* save = first;
	while(save != rear && new->priority>=save->link->priority){
		save = save->link;
	}
	new->link = save->link;
	save->link = new;
	
	if(save == rear){
		rear = new;
	}	
}
void pq_dequeue(){
	
	if(first == NULL){
		printf("Queue is Empty...!");
		return;
	}
	struct node *save = first;
	printf("Dequeued Node: %d\n",save->info);
	first=save->link;
	free(save);
}
void display(){
	
	if(first == NULL){
		printf("Linked list empty...\n");
	}
	struct node *save = first;
	while(save != rear){
		printf("(%d,%d)\t",save->info,save->priority);
		save = save->link;
	}
	printf("(%d,%d)\t",save->info,save->priority);
	printf("\n");
}

void main(){
	pq_enqueue(10,1);
	pq_enqueue(20,2);
	pq_enqueue(30,3);
	pq_enqueue(50,5);
	pq_enqueue(60,6);
	pq_enqueue(40,4);
	pq_dequeue();
	pq_dequeue();
	display();
}


