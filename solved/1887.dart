//import 'dart:math';

import 'dart:collection';

void main() {
  Solution().main();
}

class Solution {
  void main() {
    print(reductionOperations([5, 1, 3]));
  }

  int reductionOperations(List<int> nums) {
    SplayTreeMap<int, int> map = SplayTreeMap();
    for (int num in nums) {
      if (map.containsKey(num)) {
        map[num] = map[num]! + 1;
      } else {
        map[num] = 1;
      }
    }

    List<int> amounts = map.values.toList();
    int toReturn = 0;

    for (int i = 0; i < amounts.length; i++) {
      toReturn += amounts[i] * i;
    }

    return toReturn;
  }
}
