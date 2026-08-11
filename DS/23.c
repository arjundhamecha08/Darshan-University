#include <stdio.h>
#define n 15
char S[n];
int top = -1;

void push(char ele){
	if(top>=n-1){
		printf("Stack Overflow...\n");
	}
	else{
		S[++top]=ele;
	}
}

char pop(){
	if(top==-1){
		printf("Stack is underflow...\n");
	}
	else{
		return S[top--];
	}
}
void display(){
	if(top==-1){
		printf("Stack is underflow...\n");
	}
	else{
		int temp=top;
		while(temp!=-1){
			printf("%c\n",S[temp]);
			temp--;
		}
	}
}
void main(){
	int flag=0;
	char str[25];
	printf("Enter String: ");
	scanf("%s",str);
	push('c');
	int i=0;
	while(str[i] != 'c'){
		push(str[i]);
		i++;
	}
	i++;
	while(S[top]!='c'){
		if(pop() != str[i]){
			printf("invalid");
			break;
		}
		i++;
	}
	if(str[i]=='\0'){
		printf("Valid...");
	}
	else{
		printf("Invalid...");
	}
}
