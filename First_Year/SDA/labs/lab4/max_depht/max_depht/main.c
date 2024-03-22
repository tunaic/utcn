#include <stdio.h>
#include <stdlib.h>

#define max(a, b) (((a) > (b)) ? (a) : (b))

struct TreeNode {
    int data;
    struct TreeNode* left, * right;
};

struct TreeNode* createNode(int val) {
    struct TreeNode* new_node = (struct TreeNode*)malloc(sizeof(struct TreeNode));
    if (!new_node)
        return NULL;

    new_node->data = val;
    new_node->left = NULL;
    new_node->right = NULL;
}

int maxDepth(struct TreeNode* root) {
    if (root == NULL)
        return 0;
    else {
        int leftDepth = maxDepth(root->left);
        int rightDepth = maxDepth(root->right);
        if (leftDepth < rightDepth)
            return rightDepth + 1;
        else
            return leftDepth + 1;
    }
}

int inaltime(struct TreeNode* root) {
    if (root == NULL)
        return 0;
    return 1 + ((inaltime(root->left) > inaltime(root->right)) ? inaltime(root->left) : inaltime(root->right));
}

int countNodes(struct TreeNode* root) {
    // Base case: if root is NULL, return 0
    if (root == NULL) {
        return 0;
    }

    int left_count = countNodes(root->left);
    int right_count = countNodes(root->right);

    // Add 1 for the current node
    return 1 + max(left_count, right_count);
}


int diameterOfBinaryTree(struct TreeNode* root) {
    if (root == NULL)
        return 0;

    int left_height = maxDepth(root->left);
    int right_height = maxDepth(root->right);

    int left_diameter = diameterOfBinaryTree(root->left);
    int right_diameter = diameterOfBinaryTree(root->right);

    return max(left_height + right_height, max(left_diameter, right_diameter));
}


int main() {

    struct TreeNode* root = (struct TreeNode*)malloc(sizeof(struct TreeNode));
    if (!root)
        return -1;

    root->data = 10;
    root->left = createNode(5);
    root->right = createNode(15);
    root->left->left = createNode(3);
    root->left->right = createNode(7);
    root->right->left = createNode(12);
    root->right->right = createNode(20);


    int depth = maxDepth(root);
    int height = inaltime(root);
    int diameter = diameterOfBinaryTree(root);

    printf("Adancimea maxima a arborelui binar este: %d\n", depth);
    printf("Inaltimea arborelui binar este: %d\n", height);
    printf("Diametrul arborelui binar este: %d\n", diameter);

	return 0;
}