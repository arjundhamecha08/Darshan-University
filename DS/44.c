#include<stdio.h>
#define N 5

struct element{
	int value;
	int priority;
}; 

struct element PQ[N];
int F = -1;
int R = -1;

void enqueue(int x,int y){
	if(R==N-1){
		printf("Queue is Overflow..!");
		return;
	}
	if(F==-1){
		F=0;
	}
	R++;
	PQ[R].value = x;
	PQ[R].priority = y;
}
int dequeue_dsc(){
	if(F == -1){
		printf("Queue is Empty..!");
		return -1;
	}
	int i,max = F;
	for(i=F;i<=R;i++){
		if(PQ[i].priority>PQ[max].priority){
			max = i;
		}	
	}
	int  y = PQ[F].value;
	if(F == R){
		F = R = -1;
	}
	for(i=max;i<R;i++){
		PQ[i] = PQ[i+1];
	}
	R--;
	return y;	
}
int dequeue_asc(){
	if(F == -1){
		printf("Queue is Empty..!");
		return -1;
	}
	int i,min=F;
	for(i = F;i<=R;i++){
		if(PQ[min].priority>PQ[i].priority){
			min = i;
		}
	}
	int  y = PQ[F].value;
	if(F == R){
		F = R = -1;
	}
	for(i=min;i<R;i++){
		PQ[i] = PQ[i+1];
	}
	R--;
	return y;
	
}
void display(){
	if(F==-1){
		printf("Queue is Empty..");
		return;
	}
	int i = F;
	while(i<=R){
		printf("%d\t",PQ[i].value);
		i++;
	}
	printf("\n");
}
void main(){
	enqueue(10,1);
	enqueue(20,2);
	enqueue(30,3);
	enqueue(40,4);
	enqueue(50,5);
	display();
	dequeue_asc();
	display();
	dequeue_dsc();
	display();
}

