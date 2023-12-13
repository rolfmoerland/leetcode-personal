// //import 'dart:math';

// void main() {
//   Solution().main();
// }

// class Solution {
//   void main() {
//     print(numSpecial([
//       [0, 0, 0, 0, 0, 1, 0, 0],
//       [0, 0, 0, 0, 1, 0, 0, 1],
//       [0, 0, 0, 0, 1, 0, 0, 0],
//       [1, 0, 0, 0, 1, 0, 0, 0],
//       [0, 0, 1, 1, 0, 0, 0, 0]
//     ]));
//   }

//   int numSpecial(List<List<int>> mat) {
//     List<int> row = List.filled(mat[0].length, 0);
//     List<int> col = List.filled(mat.length, 0);

//     int toReturn = 0;

//     for (int y = 0; y < mat.length; y++) {
//       for (int x = 0; x < mat[0].length; x++) {
//         print("handling $y $x, value: ${mat[y][x]}");
//         String topbar = "--|";
//         for (int i in row) {
//           topbar += " $i|";
//         }
//         print(topbar);
//         for (int i in col) {
//           print("$i |");
//         }
//         if (mat[y][x] == 1) {
//           if (col[y] == 0 && row[x] == 0) {
//             print("this is still clean!");
//             col[y] = 1;
//             row[x] = 1;
//             toReturn++;
//           } else {
//             if (col[y] == 1) {
//               print("column obscured.");
//               col[y] = -1;
//               row[x] = -1;
//               print("to return was $toReturn, now ${toReturn - 1}");
//               toReturn--;
//               print("check: $toReturn");
//             }
//             if (row[x] == 1) {
//               print("row obscured.");
//               col[y] = -1;
//               row[x] = -1;
//               print("to return was $toReturn, now ${toReturn - 1}");
//               toReturn--;
//               print("check: $toReturn");
//             }
//           }
//         }
//       }
//     }
//     return toReturn;
//   }
// }

//import 'dart:math';

void main() {
  Solution().main();
}

class Solution {
  void main() {
    print(numSpecial([
      [0, 0, 0, 0, 0, 1, 0, 0],
      [0, 0, 0, 0, 1, 0, 0, 1],
      [0, 0, 0, 0, 1, 0, 0, 0],
      [1, 0, 0, 0, 1, 0, 0, 0],
      [0, 0, 1, 1, 0, 0, 0, 0]
    ]));
  }

  int numSpecial(List<List<int>> mat) {
    List<int> row = List.filled(mat[0].length, 0);
    List<int> col = List.filled(mat.length, 0);

    List<List<int>> matches = [];

    int toReturn = 0;

    for (int y = 0; y < mat.length; y++) {
      for (int x = 0; x < mat[0].length; x++) {
        if (mat[y][x] == 1) {
          row[x] += 1;
          col[y] += 1;
          matches.add([y, x]);
        }
      }
    }
    for (List<int> match in matches) {
      if ((col[match[0]] == 1) && (row[match[1]] == 1)) {
        toReturn++;
      }
    }
    return toReturn;
  }
}
