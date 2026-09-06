#include<stdio.h>
int sum_arr(int arr[], int n){
	int sum = 0;
	if(n==1){
		return arr[n-1];
	}
	return arr[n-1]+sum_arr(arr,n-1);
}

void main(){
	int arr[] = {1,2,3,4,5};
	printf("%d",sum_arr(arr,5));
	
}
