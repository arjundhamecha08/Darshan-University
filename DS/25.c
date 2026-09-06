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
int balancedParenthesis(char x[]){
	int i=0;
	char ele;
	while(x[i] != '\0'){
		if(x[i] == '[' || x[i] == '(' || x[i] == '{'){
			push(x[i]);
		}
		else if(x[i] == ']' || x[i] == ')' || x[i] == '}'){
			ele = pop();
			if(x[i] == ']' && ele == '['){
				continue;
			}
			else if(x[i] == '}' && ele == '{'){
				continue;
			}
			else if(x[i] == ')' && ele == '('){
				continue;
			}
			else{
				return 0;
			}
		}
		i++;
	}
	return 1;
}

void main(){
	int T,i;
	
	printf("Enter Number of Test Cases: ");
	scanf("%d",&T);
	for(i=0;i<T;i++){
		char input[25];
		printf("Enter %d test case: ",i+1);
		scanf("%s",input);
		printf("%d",balancedParenthesis(input));
		printf("\n");
	}
	
	
}
