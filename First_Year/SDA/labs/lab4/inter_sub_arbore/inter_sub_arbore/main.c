#include <stdio.h>
#include <stdlib.h>

struct TreeNode {
	int val;
	struct TreeNode* left;
	struct TreeNode* right;
};

struct TreeNode* createTreeNode(int val) {
    struct TreeNode* newNode = (struct TreeNode*)malloc(sizeof(struct TreeNode));
    newNode->val = val;
    newNode->left = NULL;
    newNode->right = NULL;
    return newNode;
}

struct TreeNode* invertTree(struct TreeNode* root) {
    if (root == NULL) {
        return NULL;
    }
    struct TreeNode* invertL = invertTree(root->left);
    struct TreeNode* invertR = invertTree(root->right);
    root->right = invertL;
    root->left = invertR;
    return root;
}

void printPreorder(struct TreeNode* root) {
    if (root == NULL)
        return;

    printf("%d ", root->val);
    printPreorder(root->left);
    printPreorder(root->right);
}

int main() {
    struct TreeNode* root = createTreeNode(4);
    root->left = createTreeNode(2);
    root->right = createTreeNode(7);
    root->left->left = createTreeNode(1);
    root->left->right = createTreeNode(3);
    root->right->left = createTreeNode(6);
    root->right->right = createTreeNode(9);

    printf("Original tree (preorder): ");
    printPreorder(root);
    printf("\n");

    root = invertTree(root);

    printf("Inverted tree (preorder): ");
    printPreorder(root);
    printf("\n");
	return 0;
}