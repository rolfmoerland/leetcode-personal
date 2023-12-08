//import 'dart:math';

void main() {
  Solution().main();
}

class Solution {
  void main() {
    print(maxCoins([2, 4, 1, 2, 7, 8]));
  }

  int maxCoins(List<int> piles) {
    piles.sort((a, b) => b.compareTo(a));
    int toReturn = 0;
    for (int i = 0; i < piles.length / 3; i++) {
      toReturn += piles[1 + i * 3];
    }
    return toReturn;
  }

  // int maxCoins(List<int> piles) {
  //   piles.sort((a, b) => b.compareTo(a));
  //   int toReturn = 0;
  //   while (piles.length > 1) {
  //     toReturn += piles[1];
  //     piles.removeRange(0, 2);
  //     piles.removeLast();
  //   }
  //   return toReturn;
  // }
}
