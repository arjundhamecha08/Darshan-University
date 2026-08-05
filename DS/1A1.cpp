#include <stdio.h>

void main(){
	
	int n,i;
	printf("Enter Number: ");
	scanf("%d",&n);
	
	int a,b,c;
	a=0;
	b=1;
	c=0;
	for(i=0;i<n;i++){
		printf("%d",a);
		a = b;
		b = b+1;
		c = a + b;
	}
}
