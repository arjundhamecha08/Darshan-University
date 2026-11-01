#include <stdio.h>

void dutch_national_flag(int arr[],int n){
	int temp;
	int low = 0;
	int mid = 0;
	int high = n-1;
	
	while (mid<= high){
		if(arr[mid] == 0){                        
			temp = arr[mid];
			arr[mid] = arr[low];
			arr[low] = temp;
			mid++;
			low++;
		}
		else if(arr[mid] == 1){
			mid++;
		}
		else{
			temp = arr[mid];
			arr[mid] = arr[high];
			arr[high] = temp;
			high--;
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
	dutch_national_flag(arr,n);
	
	printf("\nAfter Sorting: ");
	for(i=0;i<n;i++){
		printf("%d ",arr[i]);
	}
	
}
