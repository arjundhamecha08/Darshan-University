#include <stdio.h>
#include <stdlib.h>

struct node {
    int info;
    struct node *prev;
    struct node *link;
};

struct node *first = NULL;

// Insert node at front
void insert_front(int x) {
    struct node *newnode;

    newnode = (struct node *)malloc(sizeof(struct node));
    newnode->info = x;
    newnode->prev = NULL;
    newnode->link = first;

    if (first != NULL) {
        first->prev = newnode;
    }

    first = newnode;

    printf("Node inserted at front.\n");
}

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

    printf("Node inserted at end.\n");
}

// Delete node from specified position
void delete_position(int pos) {
    struct node *save;
    int i = 1;

    if (first == NULL) {
        printf("List is empty.\n");
        return;
    }

    if (pos < 1) {
        printf("Invalid position.\n");
        return;
    }

    save = first;

    while (save != NULL && i < pos) {
        save = save->link;
        i++;
    }

    if (save == NULL) {
        printf("Invalid position.\n");
        return;
    }

    if (save->prev != NULL) {
        save->prev->link = save->link;
    } else {
        first = save->link;
    }

    if (save->link != NULL) {
        save->link->prev = save->prev;
    }

    free(save);

    printf("Node deleted from position %d.\n", pos);
}

// Display all nodes
void display() {
    struct node *save;

    if (first == NULL) {
        printf("List is empty.\n");
        return;
    }

    save = first;

    printf("Doubly Linked List: NULL <-> ");

    while (save != NULL) {
        printf("%d <-> ", save->info);
        save = save->link;
    }

    printf("NULL\n");
}

// Main function
int main() {
    int choice, x, pos;

    do {
        printf("\n--- DOUBLY LINKED LIST MENU ---\n");
        printf("1. Insert at front\n");
        printf("2. Delete from specified position\n");
        printf("3. Insert at end\n");
        printf("4. Display all nodes\n");
        printf("5. Exit\n");

        printf("Enter your choice: ");
        scanf("%d", &choice);

        switch (choice) {

            case 1:
                printf("Enter value: ");
                scanf("%d", &x);
                insert_front(x);
                break;

            case 2:
                printf("Enter position: ");
                scanf("%d", &pos);
                delete_position(pos);
                break;

            case 3:
                printf("Enter value: ");
                scanf("%d", &x);
                insert_end(x);
                break;

            case 4:
                display();
                break;

            case 5:
                printf("Program terminated.\n");
                break;

            default:
                printf("Invalid choice.\n");
        }

    } while (choice != 5);

    return 0;
}