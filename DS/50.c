#include<stdio.h>
#include<string.h>

int is_palindrome(char *ele,int size){
	int i;
	int j = size-1;
	for(i=0;i<size/2;i++){
		if(*(ele+i)!=*(ele+j)){
			return 0;
		}
		j--;
	}
	return 1;
}
void main(){
	char c[] = "php";
	printf("%d",is_palindrome(c,3));
}

