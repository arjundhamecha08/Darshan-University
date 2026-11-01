#include<stdio.h>
#include<stdlib.h>
struct node{
	int info;
	struct node *link;
};


struct node* insert_end(struct node* first,int x){
	struct node *new;
	new=(struct node*) malloc(sizeof(struct node));
	new->info = x;
	if(first == NULL){
		new->link = NULL;
		first = new;
		return first;	
	}
	struct node *save = first;
	
	while(save->link != NULL){
		save = save->link;
	}
	save->link = new;
	new->link = NULL;
	
	return first;
}
int isSame(struct node* first1,struct node* first2){
	
	struct node* save1 = first1;
	struct node* save2 = first2;
	
	while(save1 != NULL && save2 != NULL){
		if(save1->info != save2->info){
			return 0;
		}
		save1 = save1->link;
		save2 = save2->link;
	}
	if(save1 == NULL && save2 == NULL){
		return 1;
	}
	return 0;
	
	
}
void display(struct node* first){
	
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
	
	struct node *first1 = 	NULL;
	struct node *first2 = NULL;
	
	first1 = insert_end(first1,10);
	first1 = insert_end(first1,20);
	first1 = insert_end(first1,30);
	first1 = insert_end(first1,40);
	first1 = insert_end(first1,50);
	
	first2 = insert_end(first2,10);
	first2 = insert_end(first2,20);
	first2 = insert_end(first2,30);
	first2 = insert_end(first2,40);
	first2 = insert_end(first2,50);
	
	display(first1);
	display(first2);
	
	if(isSame(first1,first2)){
		printf("Same");	
	}
	else{
		printf("Not same");
	}
	
}
