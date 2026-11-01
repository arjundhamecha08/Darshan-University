#include <stdio.h>
#include <stdlib.h>

struct node {
    int info;
    struct node *link;
};

struct node *first = NULL;
struct node *second = NULL;

// Insert node at end
void insert_end(int x) {
    struct node *newnode, *save;

    newnode = (struct node *)malloc(sizeof(struct node));
    newnode->info = x;

    if (first == NULL) {
        first = newnode;
        newnode->link = first;
    } else {
        save = first;

        while (save->link != first) {
            save = save->link;
        }

        save->link = newnode;
        newnode->link = first;
    }
}

// Split circular linked list into two halves
void splitList() {
    struct node *slow, *fast;

    if (first == NULL) {
        second = NULL;
        return;
    }

    if (first->link == first) {
        second = NULL;
        return;
    }

    slow = first;
    fast = first;

    while (fast->link != first &&
           fast->link->link != first) {

        slow = slow->link;
        fast = fast->link->link;
    }

    if (fast->link->link == first) {
        fast = fast->link;
    }

    second = slow->link;

    slow->link = first;
    fast->link = second;
}

// Display circular linked list
void display(struct node *head) {
    struct node *save;

    if (head == NULL) {
        printf("List is empty.\n");
        return;
    }

    save = head;

    do {
        printf("%d -> ", save->info);
        save = save->link;
    } while (save != head);

    printf("(Back to first node)\n");
}

int main() {
    int n, x, i;

    printf("Enter number of nodes: ");
    scanf("%d", &n);

    for (i = 1; i <= n; i++) {
        printf("Enter value: ");
        scanf("%d", &x);
        insert_end(x);
    }

    printf("\nOriginal Circular Linked List:\n");
    display(first);

    splitList();

    printf("\nFirst Half:\n");
    display(first);

    printf("\nSecond Half:\n");
    display(second);

    return 0;
}