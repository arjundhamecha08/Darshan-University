#include<stdio.h>
#include<stdlib.h>

struct node{
	int info;
	struct node *link;
};

struct node* first = NULL;

void insert_front(int x){
	struct node *new;
	new=(struct node*) malloc(sizeof(struct node));
	new->info = x;
	if(first == NULL){
		new->link = NULL;
		first = new;
		return;	
	}
	new->link = first;
	first = new;
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

void insert_ord(int x){
	struct node *new;
	new=(struct node*) malloc(sizeof(struct node));
	new->info = x;
	if(first == NULL){
		new->link = NULL;
		first = new;
		return;	
	}
	if(new->info < first->info){
		new->link = first;
		first = new;
		return;
	}
	struct node *save = first;
	while(save->link != NULL && save->info >= new->info){
		save = save->link;
	}

	new->link = save->link;
	save->link = new;	
}

void delete_first(){
	if(first == NULL){
		printf("Linked list Empty...!\n");
		return;
	}
	struct node *save = first;
	first = save->link;
	free(save);
}
void delete_last(){
		if(first == NULL){
		printf("Linked list Empty...!\n");
		return;
	}
	struct node *save = first;
	struct node *pred = first;
	while(save->link != NULL){
		pred = save;
		save = save->link;
	}
	pred->link = NULL;
	free(save);
}

void delete_x(int x){
	if(first == NULL){
		printf("Linked list Empty...!\n");
		return;
	}

	struct node *save = first;
	struct node *pred = first;
	while(save->link != NULL && save->info != x){
		pred = save;
		save = save->link;
	}
	if(save->info != x){
		printf("Element Not found...!\n");
		return;
	}
	if(save == first){
		first = first->link;
		free(save);
		return;
	}
	pred->link = save->link;
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

int count(){
	int count = 0;
	struct node *save = first;
	while(save != NULL){
		count++;
		save = save->link;
	}
	return count;
}
void main(){
	int choice;
	
	printf("Enter Choice: \n");
	printf("1 insert front: \n");
	printf("2 insert end: \n");
	printf("3 ordered insert: \n");
	printf("4 delete front: \n");
	printf("5 delete end: \n");
	printf("6 delete specific: \n");
	printf("7 display count: \n");
	printf("8 display: \n");
	printf("9 Exit: \n");
	scanf("%d",&choice);
	int x;
	while(1){
	switch(choice){
		case 1:
			printf("Enter element: ");
			scanf("%d",&x);
			insert_front(x);
			break;
		case 2:
			printf("Enter element: ");
			scanf("%d",&x);
			insert_end(x);
			break;
		case 3:
			printf("Enter element: ");
			scanf("%d",&x);
			insert_ord(x);
			break;
		case 4:
			delete_first();
			break;
		case 5:
			delete_last();
			break;
		case 6:
			printf("Enter element: ");
			scanf("%d",&x);
			delete_x(x);
			break;
		case 7:
			count();
			break;
		case 8:
			display();
			break;
		case 9:
			return;
		default:
			break;
	}
	}
}
