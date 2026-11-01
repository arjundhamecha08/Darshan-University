#include<stdio.h>
#include<stdlib.h>

struct node{
	int info;
	struct node* link;
};
struct node* first = NULL;
struct node* cfirst = NULL;
struct node *new;

struct node* copy_ll(){
	if(first == NULL){
		printf("Empty Linked List...!");
		return first;
	}
	
	new = (struct node*) malloc(sizeof(struct node));
	new->info = first->info;
	cfirst = new;
		
	struct node* save;
	struct node* save1;
	save = first;
	while(save->link != NULL){
		
		save1 = new;
		save = save->link;
		
		new = (struct node*) malloc(sizeof(struct node));
		new->info = save->info;
		save1->link = new;
		
		
	}
	new->link = NULL;
	return cfirst;
}

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

void display(){
	struct node* save=first;
	struct node* save1=copy_ll();
	printf("Original Linked list:\n");
	while(save != NULL){
		printf("%d\t",save->info);
		save = save->link;
	}
	printf("\n");
	printf("copied Linked list:\n");
		while(save1 != NULL){
		printf("%d\t",save1->info);
		save1 = save1->link;
	}
	
}
void main(){
	insert_end(10);
	insert_end(20);
	insert_end(30);
	insert_end(40);
	
	display();
}
