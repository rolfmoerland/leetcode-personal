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
  List<Card> cards = [];

  int toReturn = 0;

  for (int i = 0; i < lines.length; i++) {
    lines[i] = lines[i].replaceAll("  ", " ");
    List<int> winningNumbers = lines[i]
        .split(" | ")[0]
        .split(":")[1]
        .trim()
        .split(" ")
        .map((e) => int.parse(e))
        .toList();

    List<int> numbers = lines[i]
        .split(" | ")[1]
        .split(" ")
        .map((e) => int.parse(e.trim()))
        .toList();

    cards.add(Card(i + 1, winningNumbers, numbers, 1));
  }

  for (int i = 0; i < cards.length; i++) {
    int amountofMatches = 0;
    for (int number in cards[i].realNumbers) {
      if (cards[i].winningNumbers.contains(number)) {
        amountofMatches++;
      }
    }
    for (int j = 1; j <= amountofMatches; j++) {
      cards[i + j].multiplier += cards[i].multiplier;
    }
    toReturn += cards[i].multiplier;
  }
  print(toReturn);
}
