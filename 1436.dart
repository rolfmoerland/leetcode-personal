//import 'dart:math';

import 'dart:collection';

void main() {
  Solution().main();
}

class Solution {
  void main() {
    print(destCity([
      ["London", "New York"],
      ["New York", "Lima"],
      ["Lima", "Sao Paulo"]
    ]));
  }

  String destCity(List<List<String>> paths) {
    HashMap<String, int> map = HashMap();
    for (List<String> path in paths) {
      for (String destination in path) {
        if (map.containsKey(destination)) {
          map[destination] = map[destination]! + 1;
        } else {
          map[destination] = 1;
        }
      }
    }
    for (String key in map.keys) {
      if (map[key] == 1) {
        if (key != paths[0][0]) {
          return key;
        }
      }
    }
    return "err";
  }
}
