#include <stdio.h>

void main(){
	
	int n,rem,large=0;
	printf("Enter Number: ");
	scanf("%d",&n);
	int small=n;
	while(n>0){
		rem = n%10;
			if(rem<small){
				small = rem;
			}
			if(rem>large){
				large = rem;
			}
		n = n/10;
	}
	printf("Small Number: %d\n",small);
	printf("Large number: %d\n",large);
	
}
