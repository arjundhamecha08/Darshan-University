// • Add new entry in phone book
// • Remove entry from phone book
// • Search phone number
// • List all entries in ascending order of name
// • List all entries in descending order of name
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct node
{
    char *name;
    long long phone;
    struct node *lptr;
    struct node *rptr;
};

struct node *ROOT = NULL;

struct node *createNode(long long phone, char *name)
{
    struct node *new = (struct node *)malloc(sizeof(struct node));
    new->phone = phone;
    new->name = name;
    new->lptr = NULL;
    new->rptr = NULL;

    return new;
}

struct node *insert_node(struct node *root, long long phone, char *name)
{
    if (root == NULL)
    {
        return createNode(phone, name);
    }
    else if (strcmp(name, root->name) < 0)
    {
        root->lptr = insert_node(root->lptr, phone, name);
    }
    else if (strcmp(name, root->name) > 0)
    {
        root->rptr = insert_node(root->rptr, phone, name);
    }
    else if (strcmp(name, root->name) == 0)
    {
        return root;
    }
    return root;
}

struct node *minimum(struct node *root)
{
    while (root && root->lptr != NULL)
    {
        root = root->lptr;
    }
    return root;
};

struct node *deleteNode(struct node *root, char *name)
{
    if (root == NULL)
    {
        return root;
    }
    else if (strcmp(name, root->name) < 0)
    {
        root->lptr = deleteNode(root->lptr, name);
    }
    else if (strcmp(name, root->name) > 0)
    {
        root->rptr = deleteNode(root->rptr, name);
    }
    else
    {
        // case 1
        if (root->lptr == NULL && root->rptr == NULL)
        {
            free(root);
            return NULL;
        }

        // case 2
        if (root->lptr == NULL)
        {
            struct node *temp = root->rptr;
            free(root);
            return temp;
        }

        if (root->rptr == NULL)
        {
            struct node *temp = root->lptr;
            free(root);
            return temp;
        }

        // case 3
        struct node *temp = minimum(root->rptr);
        // root->phone = temp->phone;
        root->name = temp->name;
        root->rptr = deleteNode(root->rptr, name);
    }
    return root;
}
void ascending(struct node *root)
{
    if (root == NULL)
    {
        return;
    }
    ascending(root->lptr);
    printf("%s  %lld|   ", root->name, root->phone);
    ascending(root->rptr);
}

void descending(struct node *root)
{
    if (root == NULL)
    {
        return;
    }
    ascending(root->rptr);
    printf("%s  %lld|   ", root->name, root->phone);
    ascending(root->lptr);
}

int search(struct node *root, char *name)
{
    if (root == NULL)
    {
        return 0;
    }
    else if (strcmp(root->name, name) == 0)
    {
        return 1;
    }
    else if (strcmp(root->name, name) > 0)
    {
        return search(root->lptr, name);
    }
    else if (strcmp(root->name, name) < 0)
    {
        return search(root->rptr, name);
    }
}
void main()
{
    int choice;
    long long phone;
    char name[20];
    while (1)
    {

        printf("Enter Choice: \n");
        printf("1: Add new entry in phone book\n");
        printf("2: Remove entry from phone book\n");
        printf("3: Search phone number\n");
        printf("4: List all entries in ascending order of name\n");
        printf("5: List all entries in descending order of name\n");
        scanf("%d", &choice);

        switch (choice)
        {
        case 1:
            printf("\nEnter Name: ");
            scanf("%s", name);
            printf("Enter Phone Number:");
            scanf("%lld", &phone);
            ROOT = insert_node(ROOT, phone, name);
            break;

        case 2:
            printf("\nEnter Name: ");
            scanf("%s", name);
            ROOT = deleteNode(ROOT, name);
            break;

        case 3:
            printf("\nEnter Name: ");
            scanf("%s", name);
            if (search(ROOT, name))
            {
                printf("Number Found..!");
                break;
            }
            printf("Number Not Found..!");
            break;
        case 4:
            ascending(ROOT);
            break;
        case 5:
            descending(ROOT);
            break;
        default:
            break;
        }
    }

    // ROOT = insert_node(ROOT, 123456789, "PQR");
    // ROOT = insert_node(ROOT, 1234567890, "ABC");
    // ROOT = insert_node(ROOT, 1345678901, "XYZ");

    // ROOT = deleteNode(ROOT, "ABC");

    // ascending(ROOT);
    // printf("\n");
    // descending(ROOT);
    // printf("\n");
    // printf("%d", search(ROOT, "XYZ"));
    // printf("%d", search(ROOT, "ABC"));
}
