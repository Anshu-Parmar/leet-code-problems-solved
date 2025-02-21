/*
1261. Find Elements in a Contaminated Binary Tree - Daily(21/02/25)

Given a binary tree with the following rules:
  1. root.val == 0
  2. For any treeNode:
    - If treeNode.val has a value x and treeNode.left != null, then treeNode.left.val == 2 * x + 1
    - If treeNode.val has a value x and treeNode.right != null, then treeNode.right.val == 2 * x + 2
Now the binary tree is contaminated, which means all treeNode.val have been changed to -1.
Implement the FindElements class:
 - FindElements(TreeNode* root) Initializes the object with a contaminated binary tree and recovers it.
 - bool find(int target) Returns true if the target value exists in the recovered binary tree.

Example 1:
Input
  ["FindElements","find","find"]
  [[[-1,null,-1]],[1],[2]]
Output
  [null,false,true]
Explanation
  FindElements findElements = new FindElements([-1,null,-1]); 
  findElements.find(1); // return False 
  findElements.find(2); // return True 
*/
-------------------------------------------------------------------------------------------------------
/**
 * Definition for a binary tree node.
 * class TreeNode {
 *   int val;
 *   TreeNode? left;
 *   TreeNode? right;
 *   TreeNode([this.val = 0, this.left, this.right]);
 * }
 */
class FindElements {
  Set<int> nodeValues = {};

  FindElements(TreeNode? root) {
    if(root != null) {
        root.val = 0;
        nodeValues.add(0);
        recoverBinaryTree(root.left, 1);
        recoverBinaryTree(root.right, 2);
    }
  }

  void recoverBinaryTree (TreeNode? curr, int val) {
    if(curr == null) return;

    curr.val = val;
    nodeValues.add(val);
    recoverBinaryTree(curr.left, 2 * val + 1);
    recoverBinaryTree(curr.right, 2 * val +2);
  }
  
  bool find(int target) {
    return nodeValues.contains(target);
  }
}

/**
 * Your FindElements object will be instantiated and called as such:
 * FindElements obj = FindElements(root);
 * bool param1 = obj.find(target);
 */
