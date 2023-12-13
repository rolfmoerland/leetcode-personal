//import 'dart:math';

import 'dart:collection';

void main() {
  Solution().main();
}

class Solution {
  void main() {
    print(findSpecialInteger([1, 2, 2, 6, 6, 6, 6, 7, 10]));
  }

  int findSpecialInteger(List<int> arr) {
    int twentyFivePercent = (arr.length / 4).ceil();
    HashMap map = HashMap();
    for (int i in arr) {
      if (map.containsKey(i)) {
        map[i] = map[i] + 1;
      } else {
        map[i] = 1;
      }
      if (map[i] == twentyFivePercent) {
        return i;
      }
    }
    return -1;
  }
}
