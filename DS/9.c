#include <stdio.h>

int fact(int n){
	int factorial = 1;
	int i;
	for(i=n;i>0;i--){
		factorial *= i;
	}
}

void main(){
	int n,rem;
	printf("Enter Number: ");
	scanf("%d",&n);
	
	int temp = n;
	int sum = 0;
	while(temp>0){
		rem = temp%10;
		sum += fact(rem);
		temp /= 10;
		printf("%d",sum);
	}
	if(sum == n){
		printf("Strong Number");
	}
	else{
		printf("Not Strong Number");
	}
}
