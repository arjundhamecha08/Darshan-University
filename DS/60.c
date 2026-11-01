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

int findgcd(int a,int b){
	if(b==0){
		return a;
	}
	return findgcd(b,a%b);
}

void GCDNODE(){
	if(first == NULL){
		printf("Linked List Empty!");
	}
	
	struct node* save = first;
	struct node* prev = NULL;
	
	while(save->link != NULL){
		int gcd = findgcd(save->info,save->link->info);
		struct node* gcdnode = (struct node*) malloc(sizeof(struct node));
		
		gcdnode->info = gcd;
		
		prev = save;
		save = save->link;
		
		prev->link = gcdnode;
		gcdnode->link = save;
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
	insert_end(18);
	insert_end(6);
	insert_end(10);
	insert_end(3);
	GCDNODE();
	display();
}
