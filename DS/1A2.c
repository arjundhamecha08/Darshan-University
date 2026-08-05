#include <stdio.h>

void main(){
	int n;
	printf("Enter Number: ");
	scanf("%d",&n);
	
	int rem = 0;
	int temp = 0;
	while(n>0){
		rem = n%2;
		n = n/2;
		temp = rem*10;
		printf("%d",rem);
		
	}
}
