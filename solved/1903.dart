//import 'dart:math';

void main() {
  Solution().main();
}

class Solution {
  void main() {
    print(largestOddNumber(""));
  }

  String largestOddNumber(String num) {
    return num.substring(
        0,
        num.codeUnits.lastIndexWhere((element) => (element == 49 ||
                element == 51 ||
                element == 53 ||
                element == 55 ||
                element == 57)) +
            1);
  }
}
