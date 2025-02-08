#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "BST.h"

struct TreeNode *initializeTree()
{
    return NULL;
}

struct TreeNode *createTreeNode(char *key)
{
    struct TreeNode *newNode = (struct TreeNode *)malloc(sizeof(struct TreeNode));
    strcpy(newNode->key, key);
    newNode->left = NULL;
    newNode->right = NULL;
    return newNode;
}

struct TreeNode *insertRecursive(struct TreeNode *root, char *key)
{
    if (root == NULL)
    {
        return createTreeNode(key);
    }

    if (strcmp(key, root->key) < 0)
    {
        root->left = insertRecursive(root->left, key);
    }
    else if (strcmp(key, root->key) > 0)
    {
        root->right = insertRecursive(root->right, key);
    }

    return root;
}

int countNodes(struct TreeNode *root)
{
    if (root == NULL)
    {
        return 0;
    }

    return 1 + countNodes(root->left) + countNodes(root->right);
}

int getIndexRecursive(struct TreeNode *root, char *key, int index)
{
    if (root == NULL)
    {
        return -1;
    }

    if (strcmp(key, root->key) == 0)
    {
        return index + countNodes(root->left);
    }

    if (strcmp(key, root->key) < 0)
    {
        return getIndexRecursive(root->left, key, index);
    }

    return getIndexRecursive(root->right, key, index + countNodes(root->left) + 1);
}

void inorderRecursivePrint(struct TreeNode *root, FILE *file)
{
    if (root != NULL)
    {
        inorderRecursivePrint(root->left, file);
        fprintf(file, "%s : %d\n", root->key, getIndexRecursive(root, root->key, 0));
        inorderRecursivePrint(root->right, file);
    }
}