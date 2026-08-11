#include <stdio.h>
#define n 5
int arr[n];
int top = -1;

void push(int ele){
	if(top>=n-1){
		printf("Stack Overflow...\n");
	}
	else{
		arr[++top]=ele;
	}
}

int pop(){
	if(top==-1){
		printf("Stack is underflow...\n");
	}
	else{
		return arr[top--];
	}
}
int peep(int pos){
	if(top-pos+1 > -1){
		return arr[top-pos+1];
	}
	return 0;
}

void change(int ele,int pos){
	if(top-pos+1 > -1){
		arr[top-pos+1] = ele;
	}
}
void display(){
	if(top==-1){
		printf("Stack is underflow...\n");
	}
	else{
		int temp=top;
		while(temp!=-1){
			printf("%d\n",arr[temp]);
			temp--;
		}
	}
}
void main(){
	int choice;
	while(1){
		printf("Enter Choice: \n");
		printf(" 1 PUSH\n 2 POP\n 3 DISPLAY\n 4 PEEP\n 5 CHANGE\n 6 EXIT: ");
		scanf("%d",&choice);
		if (choice == 6){
			break;
		}
		int ele,pos;
		switch(choice){
			case 1:
				printf("Enter The Element: ");
				scanf("%d",&ele);
				push(ele);
				break;
				
			case 2:
				pop();
				break;
			
			case 3:
				display();
				break;
			
			case 4:
				printf("Enter The Position: ");
				scanf("%d",&pos);
				printf("%d\n",peep(pos));
				break;
				
			case 5:
				printf("Enter The Position and Element: ");
				scanf("%d%d",&ele,&pos);
				change(ele,pos);
				break;
			
			default:
				break;
		}
	}
}
