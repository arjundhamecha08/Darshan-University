#include <stdio.h>
#include <stdlib.h>

struct node {
    int info;
    struct node *left;
    struct node *right;
};

int preIndex = 0;

// Search root in inorder
int search(int inorder[], int start, int end, int value) {
    int i;

    for (i = start; i <= end; i++) {
        if (inorder[i] == value) {
            return i;
        }
    }

    return -1;
}

// Construct binary tree
struct node* buildTree(int inorder[], int preorder[],
                       int start, int end) {

    struct node *newnode;
    int rootValue, inIndex;

    if (start > end) {
        return NULL;
    }

    // Get root from preorder
    rootValue = preorder[preIndex++];

    newnode = (struct node*)malloc(sizeof(struct node));

    if (newnode == NULL) {
        printf("Memory allocation failed.\n");
        exit(1);
    }

    newnode->info = rootValue;
    newnode->left = NULL;
    newnode->right = NULL;

    // Find root in inorder
    inIndex = search(inorder, start, end, rootValue);

    // Construct left subtree
    newnode->left = buildTree(inorder, preorder,
                              start, inIndex - 1);

    // Construct right subtree
    newnode->right = buildTree(inorder, preorder,
                               inIndex + 1, end);

    return newnode;
}

// Display inorder traversal
void inorderDisplay(struct node *root) {
    if (root == NULL)
        return;

    inorderDisplay(root->left);
    printf("%d ", root->info);
    inorderDisplay(root->right);
}

// Display preorder traversal
void preorderDisplay(struct node *root) {
    if (root == NULL)
        return;

    printf("%d ", root->info);
    preorderDisplay(root->left);
    preorderDisplay(root->right);
}

// Display postorder traversal
void postorderDisplay(struct node *root) {
    if (root == NULL)
        return;

    postorderDisplay(root->left);
    postorderDisplay(root->right);
    printf("%d ", root->info);
}

// Main function
int main() {
    struct node *root;
    int n, i;

    printf("Enter number of nodes: ");
    scanf("%d", &n);

    if (n <= 0) {
        printf("Invalid number of nodes.\n");
        return 0;
    }

    int inorder[n], preorder[n];

    printf("Enter Inorder traversal:\n");
    for (i = 0; i < n; i++) {
        scanf("%d", &inorder[i]);
    }

    printf("Enter Preorder traversal:\n");
    for (i = 0; i < n; i++) {
        scanf("%d", &preorder[i]);
    }

    preIndex = 0;

    root = buildTree(inorder, preorder, 0, n - 1);

    printf("\nConstructed Binary Tree:\n");

    printf("Inorder: ");
    inorderDisplay(root);

    printf("\nPreorder: ");
    preorderDisplay(root);

    printf("\nPostorder: ");
    postorderDisplay(root);

    printf("\n");

    return 0;
}