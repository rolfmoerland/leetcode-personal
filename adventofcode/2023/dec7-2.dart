import 'dart:collection';
import 'dart:io';

enum Type {
  fiveOfAKind,
  fourOfAKind,
  fullHouse,
  threeOfAKind,
  twoPair,
  onePair,
  highCard
}

Map<String, int> cardToWeight = Map.from({
  "A": 14, // Typically, Ace is considered the highest value
  "K": 13, // King
  "Q": 12, // Queen
  "J": 1, // Jack
  "T": 10, // Ten
  "9": 9, // Nine
  "8": 8, // Eight
  "7": 7, // Seven
  "6": 6, // Six
  "5": 5, // Five
  "4": 4, // Four
  "3": 3, // Three
  "2": 2 // Two
});

class Card {
  String card;
  int bet;
  Type highestType;
  List<String> highestValues = [];

  Card(this.card, this.bet, this.highestType, this.highestValues);

  @override
  String toString() {
    return "Card $card, bet $bet, type = $highestType";
  }
}

Card makeCard(String card, int bet) {
  Map<String, int> map = Map();
  for (int codeunit in card.codeUnits) {
    String letter = String.fromCharCode(codeunit);
    if (map.containsKey(letter)) {
      map[letter] = map[letter]! + 1;
    } else {
      map[letter] = 1;
    }
  }

  SplayTreeMap<String, int> occurences = SplayTreeMap(
    (key1, key2) {
      int compare = map[key2]!.compareTo(map[key1]!);
      if (compare == 0) {
        // Sort by card weight:
        return cardToWeight[key2]!.compareTo(cardToWeight[key1]!);
      }
      return compare;
    },
  );
  occurences.addEntries(map.entries);
  int jokerAmount = 0;
  if (map.containsKey('J')) {
    jokerAmount = map['J']!;
  }

  Type toGiveType = Type.highCard;

  if (jokerAmount != 0) {
    if (occurences.values.first == 5) {
      toGiveType = Type.fiveOfAKind;
    } else if (occurences.values.first == 4) {
      // QQQQJ or // JJJJQ
      toGiveType = Type.fiveOfAKind;
    } else if (occurences.values.first == 3) {
      if (jokerAmount == 1) {
        toGiveType = Type.fourOfAKind;
      } else if (jokerAmount == 2) {
        toGiveType = Type.fiveOfAKind;
      } else if (jokerAmount == 3) {
        if (occurences.values.elementAt(1) == 2) {
          toGiveType = Type.fiveOfAKind;
        } else {
          toGiveType = Type.fourOfAKind;
        }
      }
    } else if (occurences.values.first == 2) {
      if (jokerAmount == 1) {
        if (occurences.values.elementAt(1) == 2) {
          toGiveType = Type.fullHouse;
        } else {
          toGiveType = Type.threeOfAKind;
        }
      } else if (jokerAmount == 2) {
        if (occurences.values.elementAt(1) == 1) {
          // JJ123
          toGiveType = Type.threeOfAKind;
        } else if (occurences.values.elementAt(1) == 2) {
          // JJ112
          toGiveType = Type.fourOfAKind;
        }
      }
    } else if (occurences.values.first == 1) {
      toGiveType = Type.onePair;
    }
  } else {
    // There are no jokers to worry about
    if (occurences.values.first == 5) {
      toGiveType = Type.fiveOfAKind;
    } else if (occurences.values.first == 4) {
      toGiveType = Type.fourOfAKind;
    } else if (occurences.values.first == 3) {
      if (occurences.values.elementAt(1) == 2) {
        toGiveType = Type.fullHouse;
      } else {
        toGiveType = Type.threeOfAKind;
      }
    } else if (occurences.values.first == 2) {
      if (occurences.values.elementAt(1) == 2) {
        toGiveType = Type.twoPair;
      } else {
        toGiveType = Type.onePair;
      }
    }
  }

  return Card(card, bet, toGiveType, occurences.keys.toList());
}

void main() {
  File file = new File('dec7.txt');
  List<String> lines = file.readAsLinesSync();
  SplayTreeSet<Card> sortedCards = SplayTreeSet(
    (key1, key2) {
      int compare = key1.highestType.index.compareTo(key2.highestType.index);
      if (compare != 0) return compare;

      //So the sort is the same. Now check the letters.

      for (int i = 0; i < 5; i++) {
        int difference = cardToWeight[key2.card.substring(i, i + 1)]!
            .compareTo(cardToWeight[key1.card.substring(i, i + 1)]!);
        if (difference != 0) return difference;
      }
      return 0;
    },
  );

  for (String line in lines) {
    List<String> values = line.split(" ");
    sortedCards.add(makeCard(values[0], int.parse(values[1])));
  }

  for (int i = 0; i < sortedCards.length; i++) {
    print(sortedCards.elementAt(i));
  }
  print("total length: ${sortedCards.length}");

  int toReturn = 0;

  int rank = sortedCards.length;
  int index = 0;
  while (index < sortedCards.length) {
    toReturn += rank * sortedCards.elementAt(index).bet;
    index++;
    rank--;
  }

  print("answer: $toReturn");
}
