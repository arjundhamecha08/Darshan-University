#include <stdio.h>

void main(){
	
	int n,rem1,temp,rem2,freq;
	printf("Enter Number: ");
	scanf("%d",&n);
	
	temp = n;
	freq = 0;
	while(n>0){
		rem1 = n % 10;
		while(temp>0){
			rem2 = temp%10;
			if(rem1 == rem2){
				freq++;
			}
			temp = temp/10;
		}
		printf("%d numbers frequency: %d\n",rem1,freq);
		n = n/10;
	}
}
