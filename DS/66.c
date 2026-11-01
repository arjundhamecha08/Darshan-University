#include <stdio.h>
#include <stdlib.h>

struct node {
    int coeff;
    int exp;
    struct node *link;
};

// Insert node at end
void insertEnd(struct node **head, struct node **tail, int c, int e) {
    struct node *newnode;

    if (c == 0)
        return;

    newnode = (struct node *)malloc(sizeof(struct node));

    newnode->coeff = c;
    newnode->exp = e;
    newnode->link = NULL;

    if (*head == NULL) {
        *head = newnode;
    } else {
        (*tail)->link = newnode;
    }

    *tail = newnode;
}

// Create polynomial
struct node *createPoly() {
    struct node *head = NULL, *tail = NULL;
    int n, c, e, i;

    printf("Enter number of terms: ");
    scanf("%d", &n);

    printf("Enter coefficient and exponent in descending order:\n");

    for (i = 0; i < n; i++) {
        printf("Enter coefficient and exponent: ");
        scanf("%d%d", &c, &e);

        insertEnd(&head, &tail, c, e);
    }

    return head;
}

// Add two polynomials
struct node *addPoly(struct node *p, struct node *q) {
    struct node *result = NULL, *tail = NULL;

    while (p != NULL && q != NULL) {

        if (p->exp == q->exp) {
            insertEnd(&result, &tail,
                      p->coeff + q->coeff, p->exp);

            p = p->link;
            q = q->link;
        }

        else if (p->exp > q->exp) {
            insertEnd(&result, &tail, p->coeff, p->exp);
            p = p->link;
        }

        else {
            insertEnd(&result, &tail, q->coeff, q->exp);
            q = q->link;
        }
    }

    // Copy remaining terms of first polynomial
    while (p != NULL) {
        insertEnd(&result, &tail, p->coeff, p->exp);
        p = p->link;
    }

    // Copy remaining terms of second polynomial
    while (q != NULL) {
        insertEnd(&result, &tail, q->coeff, q->exp);
        q = q->link;
    }

    return result;
}

// Display polynomial
void display(struct node *save) {
    int firstTerm = 1, c;

    if (save == NULL) {
        printf("0\n");
        return;
    }

    while (save != NULL) {
        c = save->coeff;

        if (firstTerm) {
            if (c < 0)
                printf("-");
        } else {
            if (c >= 0)
                printf(" + ");
            else
                printf(" - ");
        }

        if (save->exp == 0) {
            printf("%d", abs(c));
        } else {
            if (abs(c) != 1)
                printf("%d", abs(c));

            printf("x");

            if (save->exp != 1)
                printf("^%d", save->exp);
        }

        firstTerm = 0;
        save = save->link;
    }

    printf("\n");
}

// Main function
int main() {
    struct node *poly1, *poly2, *sum;

    printf("\nEnter First Polynomial:\n");
    poly1 = createPoly();

    printf("\nEnter Second Polynomial:\n");
    poly2 = createPoly();

    printf("\nFirst Polynomial: ");
    display(poly1);

    printf("Second Polynomial: ");
    display(poly2);

    sum = addPoly(poly1, poly2);

    printf("Addition of Polynomials: ");
    display(sum);

    return 0;
}