#include<stdio.h>
#include<stdlib.h>
struct Student{
	char name[25];
	char branch[25];
	int r_no;
	int batch_no;
};
void main(){
	struct Student* new =(struct Student*) malloc(sizeof(struct Student));
	printf("Enter Details: Rollno,Name,Branch,Batch_no: ");
	scanf("%d",&new->r_no);
	scanf("%s",new->name);
	scanf("%s",new->branch);
	scanf("%d",&new->batch_no);
	
	printf("Student Details: \n");
	printf("Roll No : %d\n",new->r_no);
	printf("Name : %s\n",new->name);
	printf("Branch : %s\n",new->branch);
	printf("Batch No : %d",new->batch_no);
	
	free(new);
	
}
