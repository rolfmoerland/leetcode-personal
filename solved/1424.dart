//import 'dart:math';

void main() {
  Solution().main();
}

class Solution {
  void main() {
    print(findDiagonalOrder([
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]));
  }

  List<int> findDiagonalOrder(List<List<int>> nums) {
    List<List<int>> offset = [];

    for (int y = 0; y < nums.length; y++) {
      for (int x = 0; x < nums[y].length; x++) {
        if (offset.length <= (x + y)) {
          offset.add([nums[y][x]]);
        } else {
          offset[y + x].add(nums[y][x]);
        }
      }
    }
    List<int> toReturn = [];
    for (List<int> row in offset) {
      for (int i = row.length - 1; i >= 0; i--) {
        toReturn.add(row[i]);
      }
    }
    return toReturn;
  }
}
