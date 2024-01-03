//import 'dart:math';

void main() {
  Solution().main();
}

class Solution {
  void main() {
    print(numberOfBeams(["011001", "000000", "010100", "001000"]));
  }

  List<int> removeZeroes(List<String> input) {
    List<int> output = [];
    for (String line in input) {
      int count = line.codeUnits.where((element) => element == 49).length;
      if (count != 0) output.add(count);
    }
    return output;
  }

  int numberOfBeams(List<String> bank) {
    int toReturn = 0;
    List<int> lasers = removeZeroes(bank);
    if (lasers.length < 2) return 0;
    for (int i = 1; i < lasers.length; i++) {
      toReturn += lasers[i - 1] * lasers[i];
    }
    return toReturn;
  }
}
