#include<stdio.h>

void Selection_Sort(int arr[], int n){
	int i,j,min_index,temp;
	
	for(i=0;i<n-1;i++){
		min_index = i;
		for(j=i+1;j<n;j++){
			if(arr[min_index]>arr[j]){
				min_index = j;
			}
		}
		if(min_index != i){
			temp = arr[min_index];
			arr[min_index] = arr[i];
			arr[i] = temp;
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
	Selection_Sort(arr,n);
	
	printf("After Sorting: ");
	for(i=0;i<n;i++){
		printf("%d ",arr[i]);
	}
}

