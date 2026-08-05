#include <stdio.h>

void main(){
	int size,i,j,k;
	printf("Enter Size of an array: ");
	scanf("%d",&size);
	
	int arr[size];
	
	for(i=0;i<size;i++){
		printf("Enter Element: ");
		scanf("%d",&arr[i]);
	}
	
	for(i=0;i<size;i++){
		for(j=i+1;j<size;j++){
			if(arr[i] == arr[j]){
				for(k=j;k<size;k++){
					arr[k] = arr[k+1];
				}
				size--;
				j--;
			}
		}
	}
	for(i=0;i<size;i++){
		printf("%d",arr[i]);	
	}
}
