#include <stdio.h>
#define N 5

int Q[N];
int F = -1;
int R = -1;
void insert_f(int x){
	if(F==0){
		printf("Queue is Overflow..!");
		return;
	}
	if(F == -1){
		F = 0;
		R = 0;
	}else{
		F--;
	}
	Q[F] = x;	
}
void insert_r(int x){
	if(R == N-1){
		printf("Queue Overflow...");
		return;
	}
	Q[++R] = x;
	if(F == -1)
		F=0;
}
int delete_r(){
	if(R == -1){
		printf("Queue is Empty...!");
		return -1;
	}
	int y = Q[R];
	if(F==R){
		F = -1;
		R = -1;
	}
	else{
		R--;
	}
	return y;
}
int delete_f(){
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
//		printf("From Display");
		printf("Queue is Empty..");
		return;
	}
	int i = F;
	while(i<=R){
		printf("%d\t",Q[i]);
		i++;
	}
	printf("\n");
}

void main(){
	int choice;
	while(1){
		printf("Enter Choice\n");
		printf("1 for insert at front\n");
		printf("2 for insert at rare\n");
		printf("3 for delete at front\n");
		printf("4 for delete at rare\n");
		printf("5 for display\n");
		printf("6 Exit: ");
		scanf("%d",&choice);
		
		int x;
		switch(choice){
			case 1:
				printf("Enter an Element: ");
				scanf("%d",&x);
				insert_f(x);
				break;
				
			case 2:
				
				printf("Enter an Element: ");
				scanf("%d",&x);
				insert_r(x);
				break;
				
			case 3:
				printf("Deleted Element %d",delete_f());
				break;
				
			case 4:
				printf("Deleted Element %d",delete_r());
				break;
				
			case 5:
				display();
				break;
				
			case 6:
				return;
		}
		
	}
	
	
}
