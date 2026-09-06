#include <stdio.h>

int rev(int x,int reverse){
	if(x==0){
		return reverse;
	}
	return rev(x/10, reverse*10 + x%10);
}

void main(){
	int x;
	printf("Enter Number: ");
	scanf("%d",&x);
	printf("%d",rev(x,0));
}
	
	
