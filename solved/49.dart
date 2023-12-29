//import 'dart:math';

import 'dart:collection';

void main() {
  Solution().main();
}

class Solution {
  void main() {
    print(groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"]));
  }

  List<List<String>> groupAnagrams(List<String> strs) {
    Map<String, List<String>> map = Map();

    for (String word in strs) {
      List<int> sortedCodeunits = List.from(word.codeUnits);
      sortedCodeunits.sort();
      String sortedWord = String.fromCharCodes(sortedCodeunits);
      if (map.containsKey(sortedWord)) {
        map[sortedWord]!.add(word);
      } else {
        map[sortedWord] = [word];
      }
    }

    return map.values.toList();
  }
}
