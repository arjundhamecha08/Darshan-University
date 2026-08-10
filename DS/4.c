#include <stdio.h>

void main(){
	
	int n,rem1,temp,rem2,freq;
	printf("Enter Number: ");
	scanf("%d",&n);
	
	// temp = n;
	int i;
	for(i = 0; i<=9;i++){
		temp = n;
		freq = 0;
		while(temp>0){
			rem2 = temp%10;
			if(rem2==i){
				freq++;
			}
			temp = temp/10;
		}
		if(freq>0){
			printf("Frequency of %d is %d\n",i,freq);
		}
	}
}
