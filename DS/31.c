#include <stdio.h>
#define N 20
#include<math.h>
#include<ctype.h>
int S[N];
int top = -1;


void push(int ele){
	if(top>=N-1){
		printf("Stack Overflow...\n");
	}
	else{
		S[++top]=ele;
	}
}

int pop(){
	if(top==-1){
		printf("Stack is underflow...\n");
	}
	else{
		return S[top--];
	}
}
void evalpostfix(char postfix[]){
	int i=0;
	
	while(postfix[i] != '\0'){
		if(isdigit(postfix[i])){
			push(postfix[i]-'0');
		}else{
			int operand2 = pop();
			int operand1 = pop();
			
			switch(postfix[i]){
				case '+':
					push(operand1+operand2);
					break;
				case '-':
					push(operand1-operand2);
					break;
				case '*':
					push(operand1*operand2);
					break;
				case '/':
					push(operand1/operand2);
					break;
				case '%':
					push(operand1%operand2);
					break;
				case '^':
					push(pow(operand1,operand2));
					break;
				default:
					break;
			}
		}
		i++;
	}
	printf("Answer: %d",pop());
}
void main(){
	char postfix[N];
	printf("Enter Postfix String: ");
	scanf("%s",postfix);
	evalpostfix(postfix);
}
