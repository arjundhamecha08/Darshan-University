#include <stdio.h>

void main(){
	
	int n;
	printf("Enter Number: ");
	scanf("%d",&n);
	
	int sum,count,product,rem;
	sum = 0;
	count = 0;
	product = 1;
	while(n>0){
		rem = n%10;
		n = n/10;
		
		sum = sum + rem;
		product = product * rem;
		count++;
	}	
	printf("Sum: %d\n",sum);
	printf("product: %d\n",product);
	printf("count: %d\n",count);
}
