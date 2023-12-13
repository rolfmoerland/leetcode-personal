//import 'dart:math';

void main() {
  Solution().main();
}

class Solution {
  void main() {
    print(numSpecial([
      [1, 0, 0],
      [0, 0, 1],
      [1, 0, 0]
    ]));
  }

  int numSpecial(List<List<int>> mat) {
    List<int> row = List.filled(mat.length, 0);
    List<int> col = List.filled(mat[0].length, 0);

    List<List<int>> lastSpecialRow =
        List.filled(mat.length, List.filled(mat[0].length, 0));
    List<List<int>> lastSpecialCol =
        List.filled(mat.length, List.filled(mat.length, 0));

    int toReturn = 0;

    for (int y = 0; y < mat.length; y++) {
      for (int x = 0; x < mat[0].length; x++) {
        if (mat[y][x] == 1) {
          if (lastSpecialCol[y][0] == 0 && lastSpecialRow == 0) {
            lastSpecialCol[y] = [1, x];
            lastSpecialRow[x] = [1, y];
            toReturn++;
          }
          if (lastSpecialCol[y][0] == 1) {
            lastSpecialCol[y][0] = -1;
            toReturn -= 2;
          }
          if (lastSpecialRow[x][0] == -1) {
            lastSpecialRow[x][0] = -1;
            toReturn -= 2;
          }
        }
      }
    }
    return toReturn;
  }
}
