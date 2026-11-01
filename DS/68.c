#include <stdio.h>
#include <stdlib.h>

struct node {
    int info;
    struct node *prev;
    struct node *link;
};

struct node *first = NULL;

// Insert node at end
void insert_end(int x) {
    struct node *newnode, *save;

    newnode = (struct node *)malloc(sizeof(struct node));
    newnode->info = x;
    newnode->link = NULL;

    if (first == NULL) {
        newnode->prev = NULL;
        first = newnode;
    } else {
        save = first;

        while (save->link != NULL) {
            save = save->link;
        }

        save->link = newnode;
        newnode->prev = save;
    }
}

// Delete alternate nodes
void delete_alternate() {
    struct node *save, *temp;

    if (first == NULL) {
        printf("List is empty.\n");
        return;
    }

    save = first;

    while (save != NULL && save->link != NULL) {

        temp = save->link;

        save->link = temp->link;

        if (temp->link != NULL) {
            temp->link->prev = save;
        }

        free(temp);

        save = save->link;
    }

    printf("Alternate nodes deleted successfully.\n");
}

// Display linked list
void display() {
    struct node *save;

    if (first == NULL) {
        printf("List is empty.\n");
        return;
    }

    save = first;

    printf("NULL <-> ");

    while (save != NULL) {
        printf("%d <-> ", save->info);
        save = save->link;
    }

    printf("NULL\n");
}

// Main function
int main() {
    int n, x, i;

    printf("Enter number of nodes: ");
    scanf("%d", &n);

    for (i = 1; i <= n; i++) {
        printf("Enter value: ");
        scanf("%d", &x);

        insert_end(x);
    }

    printf("\nOriginal Doubly Linked List:\n");
    display();

    delete_alternate();

    printf("\nAfter deleting alternate nodes:\n");
    display();

    return 0;
}