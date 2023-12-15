//import 'dart:math';

void main() {
  Solution().main();
}

class Solution {
  void main() {
    print(onesMinusZeros([
      [0, 1, 1],
      [1, 0, 1],
      [0, 0, 1]
    ]));
  }

  List<List<int>> onesMinusZeros(List<List<int>> grid) {
    List<int> yValues = List.filled(grid.length, 0);
    List<int> xValues = List.filled(grid[0].length, 0);

    for (int y = 0; y < grid.length; y++) {
      for (int x = 0; x < grid[0].length; x++) {
        if (grid[y][x] == 1) {
          yValues[y]++;
          xValues[x]++;
        } else {
          yValues[y]--;
          xValues[x]--;
        }
      }
    }

    for (int y = 0; y < grid.length; y++) {
      for (int x = 0; x < grid[0].length; x++) {
        grid[y][x] = yValues[y] + xValues[x];
      }
    }
    return grid;
  }
}
