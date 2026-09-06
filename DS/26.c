#include <stdio.h>
#define N 25
char S[N];
int top = -1;

void push(char ele){
	if(top>=N-1){
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
void stringProblem(char str[]){
	int i = 0;
	while(str[i] != '\0'){
		if(str[i] == '*'){
			pop();
		}
		else{
			push(str[i]);
		}
		i++;
	}
	for(i=0;i<=top;i++){
		printf("%c",S[i]);
	}
}
void main(){
	char str[25];
	printf("Enter String: ");
	scanf("%s",str);
	stringProblem(str);
}
