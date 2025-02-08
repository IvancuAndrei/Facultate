#ifndef TREE_H
#define TREE_H

#include <stdio.h>

#define MAX_SIZE 100

struct TreeNode
{
    char key[MAX_SIZE];
    struct TreeNode *left;
    struct TreeNode *right;
};

// Declarațiile funcțiilor
struct TreeNode *initializeTree();
struct TreeNode *createTreeNode(char *key);
struct TreeNode *insertRecursive(struct TreeNode *root, char *key);
int countNodes(struct TreeNode *root);
int getIndexRecursive(struct TreeNode *root, char *key, int index);
void inorderRecursivePrint(struct TreeNode *root, FILE *file);

#endif // TREE_H