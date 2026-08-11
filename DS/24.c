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

void main(){
	int countb = 0;
	char str[25];
	printf("Enter String: ");
	scanf("%s",str);
	int i=0;
	while(str[i] != '\0'){
		if(str[i] == 'a'){
			push('a');
		}
		else{
			countb++;
		}
		i++;
	}
	if(countb == top+1){
		printf("Valid");
	}
	else{
		printf("Invalid");
	}
}
