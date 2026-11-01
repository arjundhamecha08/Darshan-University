#include <stdio.h>

void Quick_Sort(int arr[],int LB,int UB){
	int i,j,key,temp;
	int Flag = 1;
	if(LB<UB){
		i = LB;
		j = UB + 1;
		key = arr[LB];
		while(Flag){
			i++;
			while(arr[i]<key){
				i++;
			}
			j--;
			while(arr[j]>key){
				j--;
			}
			if(i<j){
				temp = arr[i];
				arr[i] = arr[j];
				arr[j] = temp;
			}
			else{
				Flag = 0;
			}
		}
			
		temp = arr[LB];
		arr[LB] = arr[j];
		arr[j] = temp;
			
		Quick_Sort(arr,LB,j-1);
		Quick_Sort(arr,j+1,UB);
	
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
	Quick_Sort(arr,0,n-1);
	
	printf("\nAfter Sorting: ");
	for(i=0;i<n;i++){
		printf("%d ",arr[i]);
	}
}
