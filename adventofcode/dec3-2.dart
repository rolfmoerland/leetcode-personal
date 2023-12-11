import 'dart:io';

class Hit {
  int x;
  int y;
  int length = 0;
  int value;
  Hit(this.x, this.y, this.value) {
    this.length = value.toString().length;
  }
}

List<Hit> getHits(List<String> lines) {
  List<Hit> hits = [];
  bool isnumber = false;
  int startX = 0;
  int startY = 0;

  for (int y = 0; y < lines.length; y++) {
    for (int x = 0; x < lines[0].length; x++) {
      if (lines[y][x].codeUnits[0] >= 48 && lines[y][x].codeUnits[0] < 58) {
        //This is a number.
        if (!isnumber) {
          isnumber = true;
          startX = x;
          startY = y;
        }
      } else {
        //This is a dot or something else.
        if (isnumber) {
          isnumber = false;
          hits.add(new Hit(
              startX, startY, int.parse(lines[y].substring(startX, x))));
        }
      }
    }
    if (isnumber) {
      isnumber = false;
      hits.add(new Hit(startX, startY, int.parse(lines[y].substring(startX))));
    }
  }
  return hits;
}

bool SurroundedBySpecialCharacter(Hit hit, List<String> lines) {
  for (int i = hit.y - 1; i <= hit.y + 1; i++) {
    for (int j = hit.x - 1; j <= hit.x + hit.length; j++) {
      if (i < 0 || j < 0 || i >= lines.length || j >= lines[0].length) {
        continue;
      }

      if (lines[i][j] != '.') {
        if (lines[i][j].codeUnits[0] >= 48 && lines[i][j].codeUnits[0] < 58) {
        } else {
          return true;
        }
      }
    }
  }
  return false;
}

int starSurroundedByText(
    List<Hit> partNumbers, int sX, int sY, List<String> lines) {
  // print("handling coordinates $sX, $sY");
  List<Hit> hits = [];
  for (int y = sY - 1; y <= sY + 1; y++) {
    for (int x = sX - 1; x <= sX + 1; x++) {
      if (y < 0 || x < 0 || y >= lines.length || x >= lines[0].length) {
        continue;
      }
      // print("handling possible hit $x, $y");
      if (lines[y][x].codeUnits[0] >= 48 && lines[y][x].codeUnits[0] < 58) {
        // print("found number at $x, $y");
        // There is a number.
        int baseX = x;
        int offset = 0;
        while (baseX > 0 &&
            lines[y][baseX - 1].codeUnits[0] >= 48 &&
            lines[y][baseX - 1].codeUnits[0] < 58) {
          baseX--;
        }
        // print("found heart of the number at $baseX, $y");
        int index = partNumbers.indexWhere((element) {
          return (element.x == baseX && element.y == y);
        });
        if (index != -1) {
          if (hits.contains(partNumbers[index])) {
            continue;
          }
          hits.add(partNumbers[index]);
          // print("added hit with value ${partNumbers[index].value}");
        }
      }
    }
  }
  if (hits.length == 2) {
    // print("found two hits");
    // print("returning ${hits[0].value * hits[1].value}");
    return hits[0].value * hits[1].value;
  }
  return 0;
}

void main() {
  // File file = new File('dec3-1.txt');
  File file = new File('dec3-1.txt');
  List<String> lines = file.readAsLinesSync();

  List<Hit> hits = getHits(lines);
  List<Hit> partnumbers = [];

  int toReturn = 0;
  for (Hit hit in hits) {
    if (SurroundedBySpecialCharacter(hit, lines)) {
      //toReturn += hit.value;
      partnumbers.add(hit);
    }
  }

  for (int y = 0; y < lines.length; y++) {
    for (int x = 0; x < lines[0].length; x++) {
      if (lines[y][x] == "*") {
        toReturn += starSurroundedByText(partnumbers, x, y, lines);
      }
    }
  }
  print(toReturn);
}
