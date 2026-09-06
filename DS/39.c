#include <stdio.h>


int palindroma(char str[],int start,int end){
	
	if(start>=end){
		return 1;
	}
	if(str[start]!=str[end]){
		return 0;
	}
	return palindroma(str,start+1,end-1);
	
}
void main(){
	char str[] = "PHP";
	int ans = palindroma(str,0,2);
	if(ans){
		printf("Palindroma");
	}
	else{
		printf("Not Palindroma");
	}
}
