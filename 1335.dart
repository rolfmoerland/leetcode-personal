//import 'dart:math';

import 'dart:math';

void main() {
  Solution().main();
}

class Solution {
  void main() {
    print(""
        //
        );
  }

  int minDifficulty(List<int> jobDifficulty, int days) {
    int jobDifficultySize = jobDifficulty.length;
    int inf = 99999999;

    // Check if it's even possible to schedule the jobs within the given days.
    // If there are fewer jobs than days, it's impossible to schedule.
    if (jobDifficultySize < days) return -1;

    // Initialize the DP array
    List<List<int>> dp = List.generate(
        days + 1, (i) => List.generate(jobDifficultySize + 1, (j) => inf));

    // Set the base case
    for (int d = 0; d <= days; d++) {
      dp[d][jobDifficultySize] = 0;
    }

    // Populate the DP array
    for (int d = 1; d <= days; d++) {
      for (int i = jobDifficultySize - d; i >= 0; i--) {
        int maxd = 0;
        dp[d][i] = inf;
        for (int j = i; j <= jobDifficultySize - d; j++) {
          maxd = max(maxd, jobDifficulty[j]);
          dp[d][i] = min(dp[d][i], maxd + dp[d - 1][j + 1]);
        }
      }
    }

    return dp[days][0] < inf ? dp[days][0] : -1;
  }
}
