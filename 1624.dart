//import 'dart:math';

import 'dart:collection';

void main() {
  Solution().main();
}

class Solution {
  void main() {
    print(maxLengthBetweenEqualCharacters("abca"));
  }

  int maxLengthBetweenEqualCharacters(String s) {
    HashMap<int, List<int>> map = HashMap();

    for (int i = 0; i < s.length; i++) {
      if (map.containsKey(s.codeUnits[i])) {
        map[s.codeUnits[i]] = [map[s.codeUnits[i]]![0], i];
      } else {
        map[s.codeUnits[i]] = [i + 1];
      }
    }
    int toReturn = -1;
    for (List<int> minmax in map.values) {
      if (minmax.length < 2) continue;
      if ((minmax[1] - minmax[0]) > toReturn) {
        toReturn = (minmax[1] - minmax[0]);
      }
    }
    return toReturn;
  }
}
