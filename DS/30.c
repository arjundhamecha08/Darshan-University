#include <stdio.h>
#include <string.h>

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

void reverseString(char str[])
{
    int i = 0;
    int j = strlen(str) - 1;

    while(i < j)
    {
        char temp = str[i];
        str[i] = str[j];
        str[j] = temp;

        i++;
        j--;
    }
}

void swapBrackets(char str[])
{
    int i = 0;

    while(str[i] != '\0')
    {
        if(str[i] == '(')
            str[i] = ')';
        else if(str[i] == ')')
            str[i] = '(';

        i++;
    }
}

void infixToPostfix(char infix[], char postfix[])
{
    push('(');

    int i = 0;
    int j = 0;

    char next = infix[i];

    while(next != '\0')
    {
        if(R(next) == 1)
        {
            postfix[j++] = next;
        }
        else
        {
            while(G(S[top]) > F(next))
            {
                postfix[j++] = pop();
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

        next = infix[++i];
    }

    postfix[j] = '\0';
}

void infixToPrefix(char infix[], char prefix[])
{
    char postfix[n];

    reverseString(infix);

    swapBrackets(infix);

    int len = strlen(infix);

    infix[len] = ')';
    infix[len + 1] = '\0';

    top = -1;

    infixToPostfix(infix, postfix);

    reverseString(postfix);

    strcpy(prefix, postfix);
}

int main()
{
    char infix[n] = "a+b*c";
    char prefix[n];

    infixToPrefix(infix, prefix);

    printf("Infix  : a+b*c\n");
    printf("Prefix : %s\n", prefix);

    return 0;
}
