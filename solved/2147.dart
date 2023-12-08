//import 'dart:math';

void main() {
  Solution().main();
}

class Solution {
  void main() {
    print(numberOfWays("SPPSSSSPPS"));
  }

  int numberOfWays(String corridor) {
    int toReturn = 0;
    List<int> codeunits = corridor.codeUnits;
    print(codeunits);

    int totalChairs = 0;
    bool canPlaceWall = false;

    for (int i = 0; i < codeunits.length - 1; i++) {
      if (codeunits[i] == 83) {
        // Seat
        totalChairs++;
        if ((totalChairs % 2) == 0) {
          //Had pair, store first wall possibility
          canPlaceWall = true;
        } else {
          // First seat back.
          canPlaceWall = false;
        }
      }
      if (canPlaceWall) {
        toReturn++;
        String visualisation = "";
        for (int j = 0; j < codeunits.length; j++) {
          visualisation += String.fromCharCode(codeunits[j]);
          if (j == i) {
            visualisation += " | ";
          }
        }
        print(visualisation);
      }
    }
    if (codeunits.last == 83) {
      totalChairs++;
    }

    if (totalChairs <= 3) {
      if (totalChairs == 2) {
        return 1;
      }
      return 0;
    }
    return toReturn;
  }
}
