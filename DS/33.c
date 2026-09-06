#include <stdio.h>

#define MAX 100

int S[MAX];
int top = -1;

void push(int x)
{
    S[++top] = x;
}

int pop()
{
    return S[top--];
}

int check(int A[], int N)
{
    int need = 1;

    top = -1;
    int i;
    for(i = 0; i < N; i++)
    {
        push(A[i]);

        while(top != -1 && S[top] == need)
        {
            pop();
            need++;
        }
    }

    if(top == -1 && need == N + 1)
        return 1;
    else
        return 0;
}

int main()
{
    int T;
    scanf("%d", &T);

    while(T--)
    {
        int N;
        scanf("%d", &N);

        int A[N];
        int i;
        for(i = 0; i < N; i++)
        {
            scanf("%d", &A[i]);
        }

        if(check(A, N))
            printf("YES\n");
        else
            printf("NO\n");
    }

    return 0;
}
