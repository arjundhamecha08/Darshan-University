#include<stdio.h>
#define N 25
struct interval{
	int start;
	int end;
};

struct interval S[N];
int top = -1;

void push(int x,int y){
	if(top>=N-1){
		printf("Stack Overflow...\n");
	}
	else{
		S[top].start=x;
		S[top].end=y;
		top++;
	}
}

//int pop(){
//	if(top==-1){
//		printf("Stack is underflow...\n");
//	}
//	else{
//		return S[top--];
//	}
//}
void merge_intervel(struct interval inter[],int len){
	int temp_st,temp_end;
	int i,j;
	for(i=0;i<len-1;i++){
		for(j=i+1;j<len;j++){
			if(inter[i].start > inter[j].start){
				temp_st = inter[i].start;
				inter[i].start = inter[j].start;
				inter[j].start = temp_st;
				
				temp_end = inter[i].end;
				inter[i].end = inter[j].end;
				inter[j].end = temp_end;
			}	
		}
	}
	for(i = 0; i < len-1; i++){
//		printf("{%d %d}",inter[i].start,inter[i].end);
		if(inter[i].end > inter[i+1].start){
			if(inter[i].end < inter[i+1].end ){
				inter[i].end = inter[i+1].end;
				printf("{%d %d}",inter[i].start,inter[i].end);
			}
		}	
	}
}
	

void main(){
	int i;
	struct interval inter[4];
	
	for(i=0;i<4;i++){
		int x,y;
		
		printf("Enter Interval %d \n",i);
		printf("Start: ");
		scanf("%d",&x);
		printf("End: ");
		scanf("%d",&y);
		
		inter[i].start = x;
		inter[i].end = y;
	}
	merge_intervel(inter,4);
}
