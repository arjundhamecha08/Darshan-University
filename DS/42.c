#include <stdio.h>
#define N 3

int Q[N];
int F = -1;
int R = -1;

void enqueue(int x){
	if(F == (R+1)%N){
		printf("Queue Overflow...!");
		return;
	}
	R = (R+1)%N;
	Q[R] = x;
	
	if(F==-1)
		F=0;
}
int dequeue(){
	if(F == -1){
		printf("Queue Underflow..!");
		return -1;
	}
	int y = Q[F];
	if(F == R){
		F=R=-1;
		return y;
	}
	F = (F+1)%N;
	return y;
}
void display(){
	if(F == -1){
		printf("Queue is Empty...!");
		return;
	}
	int i = F;
	while((i)%N!=R){
		printf("%d\t",Q[i++]);
	}
	 printf("%d\t",Q[R]);
}


void main(){
	int choice,x;
	while(1){
		printf("Enter choice\n");
		printf("1 Enqueue\n");
		printf("2 Dequeue\n");
		printf("3 Display\n");
		printf("4 Exit:");
		scanf("%d",&choice);
		switch(choice){
			case 1:
				printf("Enter Element: ");
				scanf("%d",&x);
				enqueue(x);
				break;
				
			case 2:
				dequeue();
				break;
				
			case 3:
				display();
				break;
				
			case 4:
				return;
				
			default:
				break;
				
		}
	}
}
