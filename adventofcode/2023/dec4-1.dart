import 'dart:io';

class Card {
  int number;
  List<int> winningNumbers;
  List<int> realNumbers;
  int multiplier;
  Card(this.number, this.winningNumbers, this.realNumbers, this.multiplier);
}

void main() {
  File file = new File('dec4.txt');
  List<String> lines = file.readAsLinesSync();

  int toReturn = 0;

  for (String line in lines) {
    line = line.replaceAll("  ", " ");
    int multiplier = 0;
    List<int> winningNumbers = line
        .split(" | ")[0]
        .split(":")[1]
        .trim()
        .split(" ")
        .map((e) => int.parse(e))
        .toList();

    List<int> numbers = line
        .split(" | ")[1]
        .split(" ")
        .map((e) => int.parse(e.trim()))
        .toList();

    for (int number in numbers) {
      if (winningNumbers.contains(number)) {
        if (multiplier == 0) {
          multiplier++;
        } else {
          multiplier *= 2;
        }
      }
    }
    toReturn += multiplier;
  }
  print(toReturn);
}
