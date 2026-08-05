#include <stdio.h>

void main(){
	int n,rem,sum;
	printf("Enter Number: ");
	scanf("%d",&n);
	
	int temp = n;
	sum = 0;
	while(temp>0){
		rem = temp%10;
		sum = sum + rem;
		temp = temp / 10;
	}
	if(n%sum == 0){
		printf("Harshad Number");
	}
	else{
		printf("Not Harshad Number");
	}
}
