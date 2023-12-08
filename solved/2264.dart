//import 'dart:math';

void main() {
  Solution().main();
}

class Solution {
  void main() {
    print(largestGoodInteger("7788870"));
  }

  String largestGoodInteger(String num) {
    List<int> nums = num.codeUnits;
    int toReturn = 0;
    for (int i = 2; i < nums.length; i++) {
      if (nums[i] == nums[i - 1]) {
        if (nums[i] == nums[i - 2]) {
          if (nums[i] > toReturn) {
            toReturn = nums[i];
          }
        }
      }
    }

    return toReturn == 0
        ? ""
        : String.fromCharCodes([toReturn, toReturn, toReturn]);
  }
}
