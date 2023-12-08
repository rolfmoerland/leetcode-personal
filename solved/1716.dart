//import 'dart:math';

void main() {
  Solution().main();
}

class Solution {
  void main() {
    print(totalMoney(26));
  }

  int totalMoney(int n) {
    int toReturn = 0;
    if ((((n - (n % 7)) ~/ 7) + 1) >= 2) {
      toReturn += (28 * ((n - (n % 7)) ~/ 7)) +
          (7 * ((((n - (n % 7)) ~/ 7) - 1) * ((((n - (n % 7)) ~/ 7))) ~/ 2));
    }
    for (int i = 0; i < (n % 7); i++) {
      toReturn += (((n - (n % 7)) ~/ 7) + 1) + i;
    }
    return toReturn;
  }
}
