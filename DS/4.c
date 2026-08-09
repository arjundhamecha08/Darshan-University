#include <stdio.h>

void main(){
	
	int n,rem1,temp,rem2,freq;
	printf("Enter Number: ");
	scanf("%d",&n);
	
	// temp = n;
	int i;
	freq = 0;
	for(i = 0; i<=9;i++){
		temp = n;
		rem1 = 0;
		while(temp>0){
			rem2 = temp%10;
			if(rem2==i){
				rem1++;
			}
			temp = temp/10;
		}
		if(rem1>0){
			freq++;
			printf("Frequency of %d is %d\n",i,rem1);
		}
	}
}
