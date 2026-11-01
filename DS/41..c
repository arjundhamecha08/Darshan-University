#include <stdio.h>
#define N 25

int Q[N];
int F=-1;
int R=-1;

void enqueue(int x){
	if(R == N-1){
		printf("Queue Overflow...");
		return;
	}
	Q[++R] = x;
	if(F == -1)
		F=0;
}

int dequeue(){
	if(F == -1){
		printf("Queue Underflow...!");
		return -1;
	}
	int temp = Q[F];
	if(F == R){
		F=R=-1;
	}
	else{
		F++;
	}
	return temp;
}
void display(){
	if(F==-1){
		printf("Queue is Empty..");
		return;
	}
	int i = F;
	while(i<=R){
		printf("%d\t",Q[i]);
		printf("\n");
		i++;
	}
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
