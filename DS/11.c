#include <stdio.h>

void main(){
	int size,ele;
	printf("Enter Size of an Array: ");
	scanf("%d",&size);
	int arr[size];
	int i;
	
	for(i=0;i<size;i++){
		
		printf("Enter element: ");
		scanf("%d",&ele);
		arr[i] = ele;
	}
	size--;
	int pos;
	printf("Enter Position of an element that you want to delete: ");
	scanf("%d",&pos);
	
	for(i=pos-1; i<size; i++){
		arr[i] = arr[i+1];
	}
	
	for(i=0;i<size;i++){
		printf("%d",arr[i]);
	}	
}
