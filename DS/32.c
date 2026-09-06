#include <stdio.h>
#define N 20
#include<math.h>
#include<ctype.h>
#include<string.h>
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
char* reverseString(char prefix[]){
	int i = 0;
	int j = strlen(prefix)-1;
	char temp;
	while(i<j){
		temp = prefix[i];
		prefix[i] = prefix[j];
		prefix[j] = temp;
		i++;j--;
	}
	return prefix;
}
void evalprefix(char prefix[]){
	char *reversedPre = reverseString(prefix);
	int i=0;
	while(reversedPre[i] != '\0'){
		if(isdigit(reversedPre[i])){
			push(reversedPre[i]-'0');
		}else{
			int operand1 = pop();
			int operand2 = pop();
			
			switch(reversedPre[i]){
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
	char prefix[N];
	printf("Enter Postfix String: ");
	scanf("%s",prefix);
	evalprefix(prefix);
}
