#include<stdio.h>

void main(){
	int n,*max;
	printf("Enter Size of an array: ");
	scanf("%d",&n);
	
	int arr[n];
	max = arr;
	int i;
	for(i = 0;i<n;i++){
		printf("Enter Element: ");
		scanf("%d",max+i);
	}
	for(i=1;i<n;i++){
		if(*max<arr[i]){
			max = &arr[i];
		}
	}
	printf("Maximum Number: %d",*max);
}
