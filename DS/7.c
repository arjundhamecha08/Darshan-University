#include <stdio.h>

void main(){

    int n,rem;
    printf("Enter number: ");
    scanf("%d",&n);

    int temp = n;
    int flag = 0;
    while(temp>0){
        rem = temp%10;
        
        if(rem == 0){
            flag = 1;
            break;
        }

        temp = temp/10;
    }
    if(flag == 1){
    	printf("Duck Number...!");
	}
	else{
		printf("Not Duck Number..!");
	}
}
