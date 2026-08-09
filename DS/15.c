#include <stdio.h>

void main(){
    int n,temp,digit,sum;

    printf("Enter Number: ");
    scanf("%d",&n);

    temp = n;
    while(temp != 1 && temp != 4){
        sum = 0;

        while(temp>0){
            digit = temp%10;
            sum = sum + (digit * digit);
            temp = temp/10;
        }
        temp = sum;
    }

    if(temp == 1){
        printf("%d is Happy Number",n);
    }
    else{
        printf("%d is not a Happy number",n);
    }
}