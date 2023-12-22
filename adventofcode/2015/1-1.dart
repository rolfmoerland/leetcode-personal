import 'dart:io';

void main() async {
  String input = await File("1-input.txt").readAsString();
  print("()".codeUnits);
  int floor = 0;
  for (int codeunit in input.codeUnits) {
    switch (codeunit) {
      case 40:
        floor++;
        break;
      case 41:
        floor--;
        break;
    }
  }
  print(floor);
  print("===");
}
