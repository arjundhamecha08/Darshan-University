#include<stdio.h>
#include<stdlib.h>
void main(){
	int n,i,*temp,sum=0;
	printf("Enter Number: ");
	scanf("%d",&n);
	for(i=0;i<n;i++){
		temp = (int *)malloc(sizeof(int));
		printf("Enter Number: ");
		scanf("%d",temp);
		sum += *temp;
	}
	printf("Sum: %d",sum);
}
