#include <stdio.h>
#include<string.h>
#define n 15

char S[n];
int top = -1;

void push(char ele)
{
    if(top >= n - 1)
    {
        printf("Stack Overflow...\n");
    }
    else
    {
        S[++top] = ele;
    }
}

char pop()
{
    if(top == -1)
    {
        printf("Stack Underflow...\n");
        return '\0';
    }

    return S[top--];
}

int R(char x)
{
    if(x == '+' || x == '-' || x == '*' || x == '/' || x == '^')
        return -1;

    if(x == '(' || x == ')')
        return 0;

    return 1;
}

int G(char x)
{
    if(x == '+' || x == '-')
        return 2;
    else if(x == '*' || x == '/')
        return 4;
    else if(x == '^')
        return 5;
    else if(x == '(')
        return 0;

    return 8;
}

int F(char x)
{
    if(x == '+' || x == '-')
        return 1;
    else if(x == '*' || x == '/')
        return 3;
    else if(x == '^')
        return 6;
    else if(x == '(')
        return 9;
    else if(x == ')')
        return 0;

    return 7;
}

void revpol(char infix[])
{
    char polis[n];

    push('(');

    int Rank = 0;
    int i = 0;
    int j = 0;

    char next = infix[i];

    while(next != '\0')
    {
        if(R(next) == 1)
        {
            polis[j++] = next;
        }
        else
        {
            while(G(S[top]) > F(next))
            {
                polis[j++] = pop();
            }

            if(G(S[top]) != F(next))
            {
                push(next);
            }
            else
            {
                pop();
            }
        }

        Rank += R(next);

        if(Rank < 0)
        {
            printf("Invalid expression\n");
            return;
        }

        next = infix[++i];
    }

    polis[j] = '\0';

    if(top != -1 || Rank != 1)
    {
        printf("Invalid expression\n");
    }
    else
    {
        printf("Postfix: %s\n", polis);
    }
}

int main()
{
    char infix[] = "a+b";
	strcat(infix, ")");

    revpol(infix);

    return 0;
}
