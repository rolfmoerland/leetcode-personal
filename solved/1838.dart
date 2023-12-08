//import 'dart:math';

void main() {
  Solution().main();
}

class Solution {
  void main() {
    print(maxFrequency([1, 2, 4], 5)); // 3
    print(maxFrequency([1, 4, 8, 13], 5)); // 2
    print(maxFrequency([3, 9, 6], 5)); // 1
  }

  int maxFrequency(List<int> nums, int k) {
    nums.sort();
    int maxFrequency = 1;
    bool loopedWhole = false;
    while (!loopedWhole) {
      int totalsum = 0;
      int target = 0;
      for (int i = 0; i < maxFrequency; i++) {
        totalsum += nums[i];
      }
      target = nums[maxFrequency - 1] * maxFrequency;
      if (target - totalsum <= k) {
        maxFrequency++;
        if (maxFrequency == (nums.length)) {
          return maxFrequency;
        }
      } else {
        if (maxFrequency == 2) {
          return 1;
        }
        for (int i = maxFrequency; i < nums.length; i++) {
          totalsum -= nums[i - maxFrequency];
          totalsum += nums[i];
          target = nums[i] * maxFrequency;
          if (target - totalsum < k) {
            maxFrequency++;
          } else {
            if (i == nums.length - 1) {
              loopedWhole = true;
              maxFrequency -= 1;
            }
          }
        }
      }
    }
    return maxFrequency;
  }
}
