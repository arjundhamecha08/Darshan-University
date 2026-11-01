#include<stdio.h>

void main(){
	int n,*ptr,i,j,temp;
	printf("Enter Size of an array: ");
	scanf("%d",&n);
	
	int arr[n];
	ptr = arr;
	for(i = 0;i<n;i++){
		printf("Enter Element: ");
		scanf("%d",ptr+i);
	}
	for(i=0;i<n-1;i++){
		for(j=i+1;j<n;j++){
			if(*(ptr+i)>*(ptr+j)){
				temp = *(ptr+i);
				*(ptr+i) = *(ptr+j);
				*(ptr+j) = temp;
			}
		}
	}
	for(i=0;i<n;i++){
		printf("%d\t",arr[i]);
	}
}
