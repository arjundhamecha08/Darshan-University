#include <stdio.h>

void main(){
	int n,rem,temp;
	printf("Enter Number: ");
	scanf("%d",&n);
	
	rem = 0;
	// int temp = n;
	int result  = 0;
	int Bin = 0;

	for(temp=n;temp>0;){
		rem = temp%2;
		temp = temp/2;
		result = (result + rem)*10;
	}
	printf("Result = %d\n",result);

	for(temp = result; temp>0;){
		rem = temp%10;
		temp = temp/10;
		printf("Rev: %d\n",rem);
		Bin = (Bin+rem)*10;
	}
	printf("Binary: %d",Bin);
}
