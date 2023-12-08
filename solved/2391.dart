//import 'dart:math';

void main() {
  Solution().main();
}

class Solution {
  void main() {
    print(garbageCollection(["G", "P", "GP", "GG"], [2, 4, 3]));
  }

  int garbageCollection(List<String> garbage, List<int> travel) {
    List<int> glass = [];
    List<int> paper = [];
    List<int> metal = [];

    int lastGlass = 0;
    int lastPaper = 0;
    int lastMetal = 0;

    for (int w = 0; w < garbage.length; w++) {
      int countG = 0;
      int countP = 0;
      int countM = 0;
      for (int l = 0; l < garbage[w].length; l++) {
        switch (garbage[w].codeUnits[l]) {
          case 71: //g
            lastGlass = w;
            countG++;
            break;
          case 80: //p
            lastPaper = w;
            countP++;
            break;
          case 77: //m
            lastMetal = w;
            countM++;
            break;
          default:
            print(garbage[w].codeUnits[l]);
            break;
        }
      }
      glass.add(countG);
      paper.add(countP);
      metal.add(countM);
    }

    int getTime(List<int> freqmap, int lastTime) {
      int toReturn = 0;
      for (int i = 0; i < freqmap.length; i++) {
        toReturn += freqmap[i];
        if ((lastTime == i) || freqmap.length == i) {
          return toReturn;
        }
        toReturn += travel[i];
      }
      return toReturn;
    }

    return getTime(glass, lastGlass) +
        getTime(paper, lastPaper) +
        getTime(metal, lastMetal);
  }
}
