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

void main() {
  File file = new File('dec3-1.txt');
  List<String> lines = file.readAsLinesSync();

  List<Hit> hits = getHits(lines);

  int toReturn = 0;
  for (Hit hit in hits) {
    if (SurroundedBySpecialCharacter(hit, lines)) {
      toReturn += hit.value;
    }
  }
  print(toReturn);
}
