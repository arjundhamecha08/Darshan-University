#include<stdio.h>
#include<stdlib.h>
void main(){
	int * i;
	char * c;
	float * f;
	
	i = (int *) malloc(sizeof(int));
	c = (char *) malloc(sizeof(char));
	f = (float *) malloc(sizeof(float));
	
	printf("Enter Integer: ");
	scanf("%d",i);
	
	printf("Enter Charecter: ");
	scanf(" %c",c);
	
	printf("Enter float: ");
	scanf("%f",f);
	
	printf("Integer : %d\n Charecter : %c\n Float: %f",*i,*c,*f);
	
	free(i);
	free(c);
	free(f);
	
}
