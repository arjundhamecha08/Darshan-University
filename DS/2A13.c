#include <stdio.h>

void main(){
	int size1,size2,final_size,i,j;
	printf("Enter size of array1: ");
	scanf("%d",&size1);
	
	int arr[size1];
	for(i=0;i<size1;i++){
//		printf("Enter Elements for array 1:");
		scanf("%d",&arr[i]);
	}
	
	printf("Enter size of array2: ");
	scanf("%d",&size2);
	
	
	int arr2[size2];
	for(i=0;i<size2;i++){
//		printf("Enter Elements for array 2:");
		scanf("%d",&arr2[i]);
	}
	final_size = size1+size2;
	
	
	int final_array[final_size];
	
	for(i=0;i<size1;i++){
		final_array[i] = arr[i];
	}
	
	int k=0;
	for(j=size1;j<final_size;j++){
		final_array[j] = arr2[k];
		k++;
	}
	
	for(i=0;i<final_size;i++){
		printf("%d ",final_array[i]);
	}
	
}
