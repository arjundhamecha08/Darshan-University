#include<stdio.h>
void main(){
	int n,*p;
	printf("Enter Size of an array: ");
	scanf("%d",&n);
	
	int arr[n];
	p = arr;
	
	int i;
	for(i = 0;i<n;i++){
		printf("Enter Element: ");
		scanf("%d",p+i);
	}
	for(i = 0;i<n;i++){
		printf("%d\t",*(p+i));
	}
}
