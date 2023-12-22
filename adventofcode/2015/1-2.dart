import 'dart:io';

void main() async {
  String input = await File("1-input.txt").readAsString();
  print("()".codeUnits);
  int floor = 0;
  int number = 0;
  for (int codeunit in input.codeUnits) {
    number++;
    switch (codeunit) {
      case 40:
        floor++;
        break;
      case 41:
        floor--;
        if (floor < 0) {
          print("negative!, $number");
          return;
        }
        break;
    }
  }
  print(floor);
  print("===");
}
