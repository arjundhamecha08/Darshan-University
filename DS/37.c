#include <stdio.h>

int large(int arr[],int n) {
	if(n == 1){
		return arr[0];
	}
	
	int max = large(arr,n-1);
	if(max<arr[n-1]){
		return arr[n-1];
	}
	return max;
}
void main(){
	int arr[] = {1,2,5,6,8,4};
	printf("%d",large(arr,6));
}
