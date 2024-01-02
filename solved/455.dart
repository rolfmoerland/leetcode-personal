//import 'dart:math';

void main() {
  Solution().main();
}

class Solution {
  void main() {
    print(findContentChildren([1, 2, 3], [1, 1]));
  }

  int findContentChildren(List<int> g, List<int> s) {
    int toReturn = 0;
    g.sort();
    s.sort();
    for (int child in g) {
      while (s.isNotEmpty && s.first < child) s.removeAt(0);
      if (s.isEmpty) return toReturn;
      toReturn++;
      s.removeAt(0);
    }

    return toReturn;
  }
}
