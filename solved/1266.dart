//import 'dart:math';

import 'dart:math';

void main() {
  Solution().main();
}

class Solution {
  void main() {
    print(minTimeToVisitAllPoints([
      [1, 1],
      [3, 4],
      [-1, 0]
    ]));
  }

  int minTimeToVisitAllPoints(List<List<int>> points) {
    int toReturn = 0;
    while (points.length > 1) {
      int xtrav = (points[0][0] - points[1][0]).abs();
      int ytrav = (points[0][1] - points[1][1]).abs();
      int maxx = max(xtrav, ytrav);
      toReturn += maxx;
      points.removeAt(0);
    }

    return toReturn;
  }
}
