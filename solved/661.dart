//import 'dart:math';

void main() {
  Solution().main();
}

class Solution {
  void main() {
    print(imageSmoother([
      [100, 200, 100],
      [200, 50, 200],
      [100, 200, 100]
    ]));
  }

  // void printimg(List<List<int>> inp) {
  //   for (int vy = 0; vy < inp.length; vy++) {
  //     String toPrint = "[";
  //     for (int vx = 0; vx < inp[0].length; vx++) {
  //       toPrint += inp[vy][vx].toString();
  //       if (vx != inp[0].length - 1) toPrint += "] [";
  //     }
  //     toPrint += "]";
  //     print(toPrint);
  //   }
  // }

  List<List<int>> imageSmoother(List<List<int>> img) {
    List<List<int>> result = [];
    for (int y = 0; y < img.length; y++) {
      result.add([]);
      for (int x = 0; x < img[0].length; x++) {
        int avg = 0;
        int divideBy = 0;
        for (int y2 = y - 1; y2 <= y + 1; y2++) {
          for (int x2 = x - 1; x2 <= x + 1; x2++) {
            if (x2 < 0 || x2 >= img[0].length || y2 < 0 || y2 >= img.length) {
              continue;
            }
            divideBy++;
            avg += img[y2][x2];
            //print("avg added ${img[y2][x2]}");
          }
        }
        // print("handled location x: $x, y: $y");
        // print(
        //     "avg = $avg, div = $divideBy, result = ($avg / $divideBy).floor() = ${(avg / divideBy).floor()}");
        result[y].add((avg / divideBy).floor());
        //printimg(result);
      }
    }
    return result;
  }
}
