#include<stdio.h>
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
int isVowel(char c){
	if(c == 'a' || c == 'A'
	|| c == 'e' || c == 'E'
	|| c == 'i' || c == 'I'
	|| c == 'o' || c == 'O'
	|| c == 'u' || c == 'U'){
		return 1;
	}
	return 0;
}
void reverse(){
	char temp[top+1];
	int i = 0;
	while(top != -1){
		temp[i++] = pop();
	}
	temp[i] = '\0';
	i=0;
	while(temp[i] = '\0'){
		push(temp[i++]);
	}
}
void vowel_anxiety(char str[]){
	int i=1;
	push(str[0]);
	while(str[i] != '\0'){
		printf("%d",isVowel(str[i]));
		if(isVowel(str[i])){
			reverse();
			push(str[i++]);
		}
		else{
			push(str[i++]);
		}
	}
}

void main(){
	char str[] = "abcdefghij" ;
	vowel_anxiety(str);
	printf("%s\n",str);
	printf("%s",S);
}
