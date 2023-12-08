import 'dart:math';

import 'dart:collection';

void main() {
  Solution().main();
}

class Solution {
  void main() {
    print(countCharacters(["cat", "bt", "hat", "tree"], "atach"));
  }

  int countCharacters(List<String> words, String chars) {
    HashMap<String, int> mapFromWord(String input) {
      HashMap<String, int> hash = HashMap<String, int>();
      for (int i = 0; i < input.length; i++) {
        if (hash.containsKey(input.substring(i, i + 1))) {
          hash[input.substring(i, i + 1)] =
              hash[input.substring(i, i + 1)]! + 1;
        } else {
          hash.putIfAbsent(input.substring(i, i + 1), () => 1);
        }
      }
      return hash;
    }

    HashMap<String, int> inputmap = mapFromWord(chars);

    bool checkComparison(HashMap input, HashMap toCheck) {
      for (MapEntry toCheckEntry in toCheck.entries) {
        if (!input.containsKey(toCheckEntry.key)) {
          return false;
        }
        if (input[toCheckEntry.key] < toCheckEntry.value) {
          return false;
        }
      }
      return true;
    }

    int toReturn = 0;
    for (String word in words) {
      HashMap toCompareWord = mapFromWord(word);
      if (checkComparison(inputmap, toCompareWord)) {
        toReturn += word.length;
      }
    }

    return toReturn;
  }
}
