#include <stdio.h>

void main(){
	
	int n,i;
	printf("Enter Number: ");
	scanf("%d",&n);
	
	int a,b,c;
	a=0;
	b=1;
	for(i=0;i<=n;i++){
		printf("%d  ",a);
		int temp = a;
		a = b;
		b = temp + b;
	}
}
