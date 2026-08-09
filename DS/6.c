#include<stdio.h>
void main(){
    int n,i,j,first,last,temp,temp_last,temp_first,Swapped,count;
    printf("Enter Number: ");
    scanf("%d",&n);

    last = n%10;
    temp = n;
    count = 1;
    while(temp>0){
        first = temp%10;
        temp = temp/10;
        count *= 10;
    }
    temp_last = last;
    temp_first = first;
    
    last = (n-last)+first;
    temp_last = temp_last * (count/10);
    temp_first = temp_first * (count/10);

    Swapped = (last-temp_first) + temp_last;

    

    printf("first = %d, Last = %d, Count %d " ,first,last,Swapped);
}
