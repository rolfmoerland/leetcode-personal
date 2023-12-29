//import 'dart:math';

void main() {
  Solution().main();
}

class Solution {
  void main() {
    print(minCost("abaac", [1, 2, 3, 4, 5]));
  }

  int minCost(String colors, List<int> neededTime) {
    int toReturn = 0;
    int index = 1;
    List<int> codeunits = List<int>.from(colors.codeUnits);
    while (index < codeunits.length) {
      if (codeunits[index] == codeunits[index - 1]) {
        if (neededTime[index] > neededTime[index - 1]) {
          // 2nd is more of a hassle to remove.
          toReturn += neededTime[index - 1];
          neededTime.removeAt(index - 1);
          codeunits.removeAt(index - 1);
        } else {
          toReturn += neededTime[index];
          neededTime.removeAt(index);
          codeunits.removeAt(index);
        }
      } else {
        index++;
      }
    }
    return toReturn;
  }
}
