#include <stdio.h>
#include <stdlib.h>

struct node
{
    int info;
    struct node *lptr;
    struct node *rptr;
};

struct node *ROOT = NULL;
struct node *createNode(int info)
{
    struct node *new = (struct node *)malloc(sizeof(struct node));
    new->info = info;
    new->lptr = NULL;
    new->rptr = NULL;

    return new;
}

struct node *insert_node(struct node *root, int x)
{
    if (root == NULL)
    {
        return createNode(x);
    }
    else if (root->info > x)
    {
        root->lptr = insert_node(root->lptr, x);
    }
    else if (root->info < x)
    {
        root->rptr = insert_node(root->rptr, x);
    }
    else if (root->info == x)
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

struct node *deleteNode(struct node *root, int x)
{
    if (root == NULL)
    {
        return root;
    }
    else if (root->info > x)
    {
        root->lptr = deleteNode(root->lptr, x);
    }
    else if (root->info < x)
    {
        root->rptr = deleteNode(root->rptr, x);
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
        root->info = temp->info;
        root->rptr = deleteNode(root->rptr, root->info);
    }
    return root;
}
void inorder(struct node *root)
{
    if (root == NULL)
    {
        return;
    }
    inorder(root->lptr);
    printf("%d  |   ", root->info);
    inorder(root->rptr);
}
void preorder(struct node *root)
{
    if (root == NULL)
    {
        return;
    }
    printf("%d  |   ", root->info);
    inorder(root->lptr);
    inorder(root->rptr);
}

void postorder(struct node *root)
{
    if (root == NULL)
    {
        return;
    }
    inorder(root->lptr);
    inorder(root->rptr);
    printf("%d  |   ", root->info);
}

int search(struct node *root, int x)
{
    if (root == NULL)
    {
        return 0;
    }
    else if (root->info == x)
    {
        return 1;
    }
    else if (root->info > x)
    {
        return search(root->lptr, x);
    }
    else if (root->info < x)
    {
        return search(root->rptr, x);
    }
}

void main()
{
    while (1)
    {

        int choice;
        printf("Enter Choice: ");
        printf("1: Insert a node");
        printf("2: Delete a node");
        printf("3: Search a node");
        printf("4 : Preorder Traversal");
        printf("5 : Postorder Traversal ");
        printf("6 : Inorder Traversal: \n ");
        scanf("%d", &choice);

        int x;
        switch (choice)
        {
        case 1:
            printf("Enter Number: ");
            scanf("%d", &x);
            ROOT = insert_node(ROOT, x);
            break;

        case 2:
            printf("Enter Number: ");
            scanf("%d", &x);
            ROOT = deleteNode(ROOT, x);
            break;

        case 3:
            printf("Enter Number: ");
            scanf("%d", &x);
            search(ROOT, x) == 1 ? printf("Found") : printf("Not Found");

        case 4:
            preorder(ROOT);
            break;

        case 5:
            postorder(ROOT);
            break;

        case 6:
            inorder(ROOT);
            break;

        default:
            break;
        }
    }
    // ROOT = insert_node(ROOT, 50);
    // ROOT = insert_node(ROOT, 40);
    // ROOT = insert_node(ROOT, 30);
    // ROOT = insert_node(ROOT, 60);
    // ROOT = insert_node(ROOT, 80);
    // ROOT = insert_node(ROOT, 45);

    // printf("Inorder: ");
    // inorder(ROOT);
    // printf("\n");

    // printf("Preorder: ");
    // preorder(ROOT);
    // printf("\n");

    // printf("Postorder: ");
    // postorder(ROOT);
    // printf("\n");

    // printf("%d ", search(ROOT, 80));

    // ROOT = deleteNode(ROOT, 50);

    // printf("Inorder: ");
    // inorder(ROOT);
    // printf("\n");
}