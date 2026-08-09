#include <stdio.h>

void main(){
	int n,i,j,k,ele;
	printf("Enter Array size: ");
	scanf("%d",&n);
	
	int arr[n];
	int flag=0;
	for(i=0;i<n;i++){
		scanf("%d",&arr[i]);
	}
	printf("Enter New Element: ");
	scanf("%d",&ele);
	n++;
	for(j=n-2;j>=0;j--){
		if(ele<arr[j]){
			arr[j+1] = arr[j];
		}
		else{
			arr[j+1] = ele;
			flag=1;
			break;
		}
	}
	if(!flag){
		arr[j+1]=ele;
	}
	for(i=0;i<n;i++){
		printf("%d",arr[i]);
	}

	i,j=0;
	while(i<n1 || j<n2){
		if(arr[i]<arr[j]){
			merge_array[i] = 
		}
	}
	
}
