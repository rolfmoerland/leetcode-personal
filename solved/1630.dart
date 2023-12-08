//import 'dart:math';

void main() {
  Solution().main();
}

class Solution {
  void main() {
    print(checkArithmeticSubarrays([4, 6, 5, 9, 3, 7], [0, 0, 2], [2, 3, 5]));
  }

  List<bool> checkArithmeticSubarrays(
      List<int> nums, List<int> l, List<int> r) {
    List<bool> toReturn = [];

    for (int i = 0; i < l.length; i++) {
      List<int> subset = nums.sublist(l[i], r[i] + 1);

      if (subset.length < 3) {
        toReturn.add(true);
      } else {
        subset.sort();

        int offset = subset[0] - subset[1];
        for (int i = 2; i < subset.length; i++) {
          if ((subset[i - 1] - subset[i]) != offset) {
            toReturn.add(false);
            i = subset.length;
          } else {
            if (i == subset.length - 1) {
              toReturn.add(true);
            }
          }
        }
      }
    }

    return toReturn;
  }
}
