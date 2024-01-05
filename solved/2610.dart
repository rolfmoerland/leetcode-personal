//import 'dart:math';

void main() {
  Solution().main();
}

class Solution {
  void main() {
    print(findMatrix([1, 3, 4, 1, 2, 3, 1]));
  }

  List<List<int>> findMatrix(List<int> nums) {
    Map<int, int> map = Map();
    for (int num in nums) {
      if (map.containsKey(num)) {
        map[num] = map[num]! + 1;
      } else {
        map[num] = 1;
      }
    }
    List<List<int>> toreturn = [];
    int threshold = 0;
    bool shouldContinue = true;
    while (shouldContinue) {
      List<int> round = [];
      for (int i in map.keys) {
        if (map[i]! > threshold) {
          round.add(i);
        }
      }
      if (round.isEmpty) {
        shouldContinue = false;
        return toreturn;
      }
      threshold++;
      toreturn.add(round);
    }
    return [];
  }
}
