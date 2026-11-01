#include<stdio.h>

void Bubble_Sort(int arr[],int n){
	int i,j,temp,pass;
	for(i=0;i<n-1;i++){
		for(j=0;j<n-1-i;j++){
			if(arr[j]>arr[j+1]){
				temp = arr[j];
				arr[j] = arr[j+1];
				arr[j+1] = temp;
				pass++;
			}
		}
		if(pass == 0){
			printf("Array is Sorted...");
			return;
		}
	}
}

void main(){
	int n,i;
	printf("Enter Number of size of an array");
	scanf("%d",&n);
	int arr[n];
	
	for(i=0;i<n;i++){
		printf("Enter Number For %d index: ",i);
		scanf("%d",&arr[i]);
	}
	
	printf("Before Sorting: ");
	for(i=0;i<n;i++){
		printf("%d ",arr[i]);
	}
	Bubble_Sort(arr,n);
	
	printf("After Sorting: ");
	for(i=0;i<n;i++){
		printf("%d ",arr[i]);
	}
}
