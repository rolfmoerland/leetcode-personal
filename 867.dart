//import 'dart:math';

void main() {
  Solution().main();
}

class Solution {
  void main() {
    print(transpose([
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9]
    ]));
  }

  /*  
      [1] [2] [3]
      [4] [5] [6]
      [7] [8] [9]
      


  */

  List<List<int>> transpose(List<List<int>> matrix) {
    List<List<int>> toReturn = [];
    for (int i = 0; i < matrix[0].length; i++) {
      toReturn.add([]);
      for (int j = 0; j < matrix.length; j++) {
        toReturn[i].add(matrix[j][i]);
      }
    }
    return toReturn;
  }
}
