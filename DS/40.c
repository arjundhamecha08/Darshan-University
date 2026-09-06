#include<stdio.h>
int binary(int n){
	if(n==0){
		return 0;
	}
	return(n%2 + binary(n/2)*10);
									
}

void main(){
	int n ;
	printf("Enter Number: ");
	scanf("%d",&n);
	printf("%d",binary(n));
}
