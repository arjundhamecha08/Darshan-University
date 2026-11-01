// 72. WAP to find the smallest and largest elements in the Binary Search Tree.

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

int smallest(struct node *root)
{
    while (root && root->lptr != NULL)
    {
        root = root->lptr;
    }
    return root->info;
};

int largest(struct node *root)
{
    while (root && root->rptr != NULL)
    {
        root = root->rptr;
    }
    return root->info;
};

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

void main()
{
    ROOT = insert_node(ROOT, 50);
    ROOT = insert_node(ROOT, 40);
    ROOT = insert_node(ROOT, 45);
    ROOT = insert_node(ROOT, 30);
    ROOT = insert_node(ROOT, 20);
    ROOT = insert_node(ROOT, 60);
    ROOT = insert_node(ROOT, 55);
    ROOT = insert_node(ROOT, 56);
    ROOT = insert_node(ROOT, 52);
    ROOT = insert_node(ROOT, 80);

    inorder(ROOT);
    printf("\nSmallest Element: %d\n ", smallest(ROOT));
    printf("Largest Element: %d", largest(ROOT));
}
