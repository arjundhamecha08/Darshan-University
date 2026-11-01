#include <stdio.h>
#include <stdlib.h>

struct node {
    int info;
    struct node *link;
};

struct node *first = NULL;

// Insert node at front
void insert_front(int x) {
    struct node *newnode, *save;

    newnode = (struct node *)malloc(sizeof(struct node));
    newnode->info = x;

    if (first == NULL) {
        newnode->link = newnode;
        first = newnode;
    } else {
        save = first;

        while (save->link != first) {
            save = save->link;
        }

        newnode->link = first;
        save->link = newnode;
        first = newnode;
    }

    printf("Node inserted at front.\n");
}

// Insert node at end
void insert_end(int x) {
    struct node *newnode, *save;

    newnode = (struct node *)malloc(sizeof(struct node));
    newnode->info = x;

    if (first == NULL) {
        newnode->link = newnode;
        first = newnode;
    } else {
        save = first;

        while (save->link != first) {
            save = save->link;
        }

        save->link = newnode;
        newnode->link = first;
    }

    printf("Node inserted at end.\n");
}

// Delete first node
void delete_front() {
    struct node *save;

    if (first == NULL) {
        printf("List is empty.\n");
        return;
    }

    if (first->link == first) {
        free(first);
        first = NULL;
    } else {
        save = first;

        struct node *last = first;

        while (last->link != first) {
            last = last->link;
        }

        first = first->link;
        last->link = first;

        free(save);
    }

    printf("First node deleted.\n");
}

// Delete last node
void delete_end() {
    struct node *save, *prev;

    if (first == NULL) {
        printf("List is empty.\n");
        return;
    }

    if (first->link == first) {
        free(first);
        first = NULL;
    } else {
        prev = first;
        save = first->link;

        while (save->link != first) {
            prev = save;
            save = save->link;
        }

        prev->link = first;
        free(save);
    }

    printf("Last node deleted.\n");
}

// Delete node from specified position
void delete_position(int pos) {
    struct node *save, *prev;
    int i;

    if (first == NULL) {
        printf("List is empty.\n");
        return;
    }

    if (pos < 1) {
        printf("Invalid position.\n");
        return;
    }

    if (pos == 1) {
        delete_front();
        return;
    }

    prev = first;
    save = first->link;
    i = 2;

    while (save != first && i < pos) {
        prev = save;
        save = save->link;
        i++;
    }

    if (save == first) {
        printf("Invalid position.\n");
        return;
    }

    prev->link = save->link;
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

    printf("Circular Linked List: ");

    do {
        printf("%d -> ", save->info);
        save = save->link;
    } while (save != first);

    printf("(Back to first node)\n");
}

// Main function
int main() {
    int choice, x, pos;

    do {
        printf("\n--- CIRCULAR LINKED LIST MENU ---\n");
        printf("1. Insert at front\n");
        printf("2. Insert at end\n");
        printf("3. Delete first node\n");
        printf("4. Delete last node\n");
        printf("5. Delete node from specified position\n");
        printf("6. Display all nodes\n");
        printf("7. Exit\n");

        printf("Enter your choice: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                printf("Enter value: ");
                scanf("%d", &x);
                insert_front(x);
                break;

            case 2:
                printf("Enter value: ");
                scanf("%d", &x);
                insert_end(x);
                break;

            case 3:
                delete_front();
                break;

            case 4:
                delete_end();
                break;

            case 5:
                printf("Enter position: ");
                scanf("%d", &pos);
                delete_position(pos);
                break;

            case 6:
                display();
                break;

            case 7:
                printf("Program terminated.\n");
                break;

            default:
                printf("Invalid choice.\n");
        }

    } while (choice != 7);

    return 0;
}