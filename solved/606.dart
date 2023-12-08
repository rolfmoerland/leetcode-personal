//import 'dart:math';

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

void main() {
  Solution().main();
}

class Solution {
  void main() {
    print("");
  }

  String tree2str(TreeNode? root) {
    String toReturn = "";

    void HandleNode(TreeNode? node) {
      if (node!.left != null) {
        toReturn += node.val.toString();
        toReturn += "(";
        HandleNode(node.left);
      } else {
        if (node!.right != null) {
          toReturn += "()";
        }
      }
      if (node!.right != null) {
        toReturn += node.val.toString();
        toReturn += "(";
        HandleNode(node.right);
      }
      toReturn += ")";
    }

    HandleNode(root);

    return toReturn.substring(0, toReturn.length - 1);
  }
}
