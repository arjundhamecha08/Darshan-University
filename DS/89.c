#include<stdio.h>
#include<Math.h>
void Merge(int a[],int low,int mid,int high){
	int h,i,j,k;
	h = low;
	i = low;
	j = mid + 1;
	int b[high+1];
	while(h<=mid && j<=high){
		if(a[h] <= a[j]){
			b[i] = a[h];
			h++;
		}
		else{
			b[i] = a[j];
			j++;
		}
		i++;
	}
	if(h>mid){
		for(k=j;k<=h;k++){
			b[i] = a[k];
			i++;
		}
	}
	else{
		for(k=h;k<=mid;k++){
			b[i] = a[k];
			i++;
		}
	}
	for(k = low;k<=high;k++){
		a[k] = b[k];
	}
}


void Merge_Sort(int arr[],int low,int high){
	int mid;
	if(low<high){
		mid = floor((low+high)/2);
		Merge_Sort(arr,low,mid);
		Merge_Sort(arr,mid+1,high);
		Merge(arr,low,mid,high);
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
	Merge_Sort(arr,0,n-1);
	
	printf("After Sorting: ");
	for(i=0;i<n;i++){
		printf("%d ",arr[i]);
	}
}


