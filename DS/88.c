#include<stdio.h>

void Insertion_Sort(int arr[],int n){
	int i,j,key;
	
	while(i<n){
		key = arr[i];
		j = i-1;
		while (j>=0 && arr[j] > key){
			arr[j+1] = arr[j];
			j--;
		}
		arr[j+1] = key;
		i++;
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
	Insertion_Sort(arr,n);
	
	printf("After Sorting: ");
	for(i=0;i<n;i++){
		printf("%d ",arr[i]);
	}
}

