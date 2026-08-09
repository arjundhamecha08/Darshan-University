#include<stdio.h>
#include <string.h>


char* sort_string(char str[]){
    
    char temp;
    int i,j;
    for(i=0;str[i]!='\0';i++){
        for(j=i+1;str[j]!='\0';j++){
            if(str[i]>str[j]){
                temp = str[i];
                str[i] = str[j];
                str[j] = temp;
            }
        }
    }
    return str;
}

void main(){
    char str[100];
    char anagram[100];
    printf("Enter Original String: ");
    scanf("%s",&str);

    printf("Enter Anagram String: ");
    scanf("%s",&anagram);

   char *sorted_str = sort_string(str);
   char *sorted_anagram = sort_string(anagram); 
//    if("silent"=="silent"){
//     printf("yes");
//    }
//    else{
//     printf("Flase");
//    }
    if(strcmp(sorted_str, sorted_anagram) == 0){
        printf("Strings are Anagrams");
    }
    else{
        printf("Strings are not Anagrams");
    }

}
