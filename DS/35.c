#include<stdio.h>
int sum_digit(int x){
	if(x==0){
		return 0;
	}
	return (x%10) + sum_digit(x/10);	
}
void main(){
	int x;
	printf("Enter Number: ");
	scanf("%d",&x);
	printf("%d",sum_digit(x));
}
