#include <stdio.h>
#include <stdlib.h>

struct node {
    int info;
    struct node *left;
    struct node *right;
};

// Create a binary tree
struct node* createTree() {
    int x;
    struct node *newnode;

    scanf("%d", &x);

    if (x == -1) {
        return NULL;
    }

    newnode = (struct node*)malloc(sizeof(struct node));

    newnode->info = x;

    printf("Enter left child of %d: ", x);
    newnode->left = createTree();

    printf("Enter right child of %d: ", x);
    newnode->right = createTree();

    return newnode;
}

// Check whether two trees are same
int sameTree(struct node *root1, struct node *root2) {

    // Both trees are empty
    if (root1 == NULL && root2 == NULL) {
        return 1;
    }

    // Only one tree is empty
    if (root1 == NULL || root2 == NULL) {
        return 0;
    }

    // Compare data and left and right subtrees
    if (root1->info == root2->info &&
        sameTree(root1->left, root2->left) &&
        sameTree(root1->right, root2->right)) {

        return 1;
    }

    return 0;
}

// Free memory
void freeTree(struct node *root) {
    if (root == NULL) {
        return;
    }

    freeTree(root->left);
    freeTree(root->right);
    free(root);
}

int main() {
    struct node *root1, *root2;

    printf("Create First Binary Tree:\n");
    printf("Enter node values (-1 for NULL):\n");
    root1 = createTree();

    printf("\nCreate Second Binary Tree:\n");
    printf("Enter node values (-1 for NULL):\n");
    root2 = createTree();

    if (sameTree(root1, root2)) {
        printf("\nBoth trees are SAME.\n");
    } else {
        printf("\nBoth trees are NOT SAME.\n");
    }

    freeTree(root1);
    freeTree(root2);

    return 0;
}