#include <stdio.h>

void main(){
	int num1,num2,i,min;
	printf("Enter Two Numbers: ");
	scanf("%d%d",&num1,&num2);
	
	min = num1>num2 ? num2 : num1;
	printf("%d",min);
	i=2;
	int gcd = 1;
	while(i<min){
		if(i%num1 == 0 && i%num2 == 0){
			gcd = i;
			break;
		}
		i++;
	}
	printf("%d",gcd);
	if(gcd == 1){
		printf("Co-Prime Number");
	}
	else{
		printf("Not Co-Prime Number");
	}
	
	
}
