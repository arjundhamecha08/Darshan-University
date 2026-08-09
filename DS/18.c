#include <stdio.h>
void main(){
	int n1,n2,i,j,k;
	printf("Enter size of first array: ");
	scanf("%d",&n1);
	
	printf("Enter size of second array: ");
	scanf("%d",&n2);
	int arr1[n1];
	int arr2[n2];
	int merge_array[n1+n2];
	
	printf("Enter Elements for first array: ");
	for(i=0;i<n1;i++){
		scanf("%d",&arr1[i]);
	}
	
	printf("Enter Elements for second array: ");
	for(i=0;i<n2;i++){
		scanf("%d",&arr2[i]);
	}

	i=0,k=0,j=0;
	while(i<n1 || j<n2){
		// printf("%d %d %d",i,j,k);
		if(arr1[i]<arr2[j]){
			merge_array[k] = arr1[i];
			i++;
			k++;
		}
		else{
			merge_array[k] = arr2[j];
			k++;
			j++;
		}
	}
	for(i=0;i<n1+n2;i++){
		printf("%d ",merge_array[i]);
	}
}
