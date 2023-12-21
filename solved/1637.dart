//import 'dart:math';

void main() {
  Solution().main();
}

class Solution {
  void main() {
    print(maxWidthOfVerticalArea([
      [8, 7],
      [9, 9],
      [7, 4],
      [9, 7]
    ]));
  }

  int maxWidthOfVerticalArea(List<List<int>> points) {
    int toReturn = 0;
    points.sort(
      (a, b) {
        return a[0].compareTo(b[0]);
      },
    );
    for (int i = 1; i < points.length; i++) {
      if ((points[i][0] - points[i - 1][0]) > toReturn) {
        toReturn = points[i][0] - points[i - 1][0];
      }
    }
    return toReturn;
  }
}
