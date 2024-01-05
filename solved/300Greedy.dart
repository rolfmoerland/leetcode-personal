//import 'dart:math';

import 'dart:math';

void main() {
  Solution().main();
}

class Solution {
  void main() {
    print(lengthOfLIS([4, 10, 4, 3, 8, 9]));
  }

  int lengthOfLIS(List<int> nums) {
    List<int> greed = [];
    greed.add(nums.first);
    for (int i = 1; i < nums.length; i++) {
      if (nums[i] > greed.last) {
        // This can go in the pile.
        greed.add(nums[i]);
      } else {
        // Find first number bigger and replace it.
        int index = greed.indexWhere((element) => element >= nums[i]);
        if (index != -1) greed[index] = nums[i];
      }
    }
    return greed.length;
  }
}
