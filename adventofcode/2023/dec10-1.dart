import 'dart:io';

int sX = -1;
int sY = -1;

int currentX = -1;
int currentY = -1;

int motionX = 0;
int motionY = 0;

void main() {
  void takeNextStep(int codeunit) {
    switch (codeunit) {
      case 124: // |
        currentY += motionY;
        break;
      case 45: // -
        currentX += motionX;
        break;
      case 76: // L
        if (motionX == -1) {
          motionX = 0;
          motionY = -1;
          currentY--;
        } else {
          motionX = 1;
          motionY = 0;
          currentX++;
        }
        break;
      case 74: // J
        if (motionX == 1) {
          motionX = 0;
          motionY = -1;
          currentY--;
        } else {
          motionY = 0;
          motionX = -1;
          currentX--;
        }
        break;
      case 55: // 7
        if (motionX == 1) {
          motionX = 0;
          motionY = 1;
          currentY++;
        } else {
          motionX = -1;
          motionY = 0;
          currentX--;
        }
        break;
      case 70: // F
        if (motionX == -1) {
          motionX = 0;
          motionY = 1;
          currentY++;
        } else {
          motionX = 1;
          motionY = 0;
          currentX++;
        }
        break;
      case 46: // .
        print("Error! tried to handle ., stats:");
        print("Motion: $motionX, $motionY");
        print("current: $currentX, $currentY");
        break;
      case 83: // S // Starting position:
        print("back at start!");
        currentX++;
        motionX = 1;
        break;
    }
  }

  File file = new File(
      'C:\\Users\\Gebruiker\\development\\PortableVSCode\\data\\code\\leetcode\\adventofcode\\2023\\dec10.txt');
  List<String> lines = file.readAsLinesSync();

  List<List<int>> array = [];
  for (String line in lines) {
    if (line.contains("S")) {
      sY = currentY = array.length;
      sX = currentX = line.indexOf('S');
    }
    array.add(line.codeUnits);
  }

  int steps = 1;
  takeNextStep(array[currentY][currentX]);
  while (currentX != sX || currentY != sY) {
    takeNextStep(array[currentY][currentX]);
    steps++;
    print("Steps: $steps. y: $currentY, x: $currentX");
  }
}
