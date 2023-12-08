//import 'dart:math';

import 'dart:collection';

void main() {
  Solution().main();
}

class Solution {
  void main() {
    print(countNicePairs([13, 10, 35, 24, 76]));
  }

  int countNicePairs(List<int> nums) {
    int getreverse(int num) {
      Iterable<int> reverse = num.toString().codeUnits.reversed;
      int reverseint = int.parse(String.fromCharCodes(reverse));
      return reverseint;
    }

    int getFactor(int amount) {
      if (amount <= 1) {
        return 0;
      }
      int toReturn = 0;
      for (int i = 2; i <= amount; i++) {
        toReturn += i - 1;
      }
      return toReturn;
    }

    HashMap<int, int> map = HashMap();

    for (int num in nums) {
      int difference = num - getreverse(num);
      if (map.containsKey(difference)) {
        map[difference] = map[difference]! + 1;
      } else {
        map[difference] = 1;
      }
    }

    print(map);

    int toReturn = 0;
    for (MapEntry entry in map.entries) {
      toReturn += getFactor(entry.value);
    }

    return toReturn % 1000000007;
  }
}
