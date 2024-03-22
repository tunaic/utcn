#include <stdio.h>
#include <stdlib.h>

typedef struct node_type {
    int id;
    struct node_type* left, * right;
} NodeT;

NodeT* prev = NULL, * head = NULL;

NodeT* createNode(int id) {
    NodeT* new_node = (NodeT*)malloc(sizeof(NodeT));

    if (!new_node)
        return NULL;

    new_node->id = id;
    new_node->left = NULL;
    new_node->right = NULL;

    return new_node;
}

void convert_to_dll(NodeT* root) {
    if (root == NULL)
        return;

    convert_to_dll(root->left);

    if (prev == NULL)
        head = root;
    else {
        prev->right = root;
        root->left = prev;
    }

    prev = root;
    convert_to_dll(root->right);
}


void printList() {
    NodeT* curr = head;
    while (curr != NULL) {
        printf("%d ", curr->id);
        curr = curr->right;
    }
    printf("\n");
}

int main() {
    NodeT* root = createNode(10);
    root->left = createNode(5);
    root->right = createNode(20);
    root->left->left = createNode(3);
    root->left->right = createNode(7);
    root->right->left = createNode(15);
    root->right->right = createNode(25);

    convert_to_dll(root);

    printf("Lista dublu inlantuita: ");
    printList();

    free(root);

    return 0;
}
