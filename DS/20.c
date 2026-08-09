#include <stdio.h>
void main(){
    int i,j;
    char str[100];
    
    printf("Enter String: ");
    scanf("%s",&str);
    // printf("%c",str[1]);
    // printf("%c",str[4]);
    char temp;
    for(i=0;str[i]!='\0';i++){
        for(j=i+1;str[j]!='\0';j++){
            if(str[i]>str[j]){
                temp = str[i];
                str[i] = str[j];
                str[j] = temp;
            }
        }
    }
    printf("String is: %s",str);
}
