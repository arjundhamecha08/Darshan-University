#include <stdio.h>
void main(){
	int n,i,j,ele;
	printf("Enter Size of an array: ");
	scanf("%d",&n);
	
	int flag=0;
	int arr[n];
	
	for(i=0;i<n;i++){
		scanf("%d",&arr[i]);
	}
	printf("Enter Element that you want to delete: ");
	scanf("%d",&ele);
	
	for(j=0;j<n;j++){
		if(arr[j] >= ele){
			flag=1;
			arr[j] = arr[j+1];
		}
	}
	n--;
//		printf("%d",flag);
	if(!flag){
		printf("Number not exist");
	}
	else{
		for(i=0;i<n;i++){
		printf("%d",arr[i]);
	}
	}
}
