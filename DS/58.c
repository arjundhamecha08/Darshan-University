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
	struct node* temp;
	while(save!=NULL){
		temp = save;
		while(temp->link!=NULL){
			if(save->info == temp->link->info){
				temp->link=temp->link->link;
			}else{
				temp=temp->link;
			}
		}
		save=save->link;
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
	insert_end(10);
	insert_end(40);
	insert_end(20);
	insert_end(30);
	insert_end(10);
	insert_end(40);
	insert_end(10);
	

	printf("Original Linked List: \n");
	display();
	removeDuplicate(first);
	printf("After Removing Duplicate Elements: \n");
	display();
}
