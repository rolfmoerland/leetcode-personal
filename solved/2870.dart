//import 'dart:math';

void main() {
  Solution().main();
}

class Solution {
  void main() {
    print(minOperations([2, 3, 3, 2, 2, 4, 2, 3, 4]));
  }

  int minOperations(List<int> nums) {
    Map<int, int> occurences = Map();
    for (int num in nums) {
      if (occurences.containsKey(num)) {
        occurences[num] = occurences[num]! + 1;
      } else {
        occurences[num] = 1;
      }
    }
    int toReturn = 0;
    for (int amount in occurences.values) {
      if (amount < 2) return -1;
      toReturn += (amount / 3).floor();
      if ((amount % 3) > 0) toReturn++;
    }
    return toReturn;
  }
}
