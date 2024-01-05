//import 'dart:math';

import 'dart:math';

void main() {
  Solution().main();
}

class Solution {
  void main() {
    print(lengthOfLIS([10, 9, 2, 5, 3, 7, 101, 18]));
  }

  int lengthOfLIS(List<int> nums) {
    int toReturn = 0;
    List<int> dp = List.filled(nums.length, 1);

    for (int i = 1; i < nums.length; i++) {
      for (int j = 0; j < i; j++) {
        if (nums[j] < nums[i]) {
          dp[i] = max(dp[j] + 1, dp[i]);
        }
      }
    }

    for (int i in dp) {
      toReturn = max(toReturn, i);
    }
    return toReturn;
  }
}
