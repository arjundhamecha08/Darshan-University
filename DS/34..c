#include<stdio.h>
int fibbo(int x){
	
	if(x==1){
		return 1;
	}
	if(x==0){
		return 0;
	}
	return fibbo(x-1) + fibbo(x-2);
	
}

void main(){
	int x;
	printf("Enter Number: ");
	scanf("%d",&x);
	printf("%d",fibbo(x));
	
	
}
