import 'dart:collection';
import 'dart:io';

List<String> getLRCommands(String line) {
  List<String> toReturn = [];
  for (int i = 0; i < line.length; i++) {
    toReturn.add(line.substring(i, i + 1));
  }
  return toReturn;
}

List<String> parseLine(String input) {
  List<String> splitted = input.split("=");
  String base = splitted[0].trim();
  String left = splitted[1]
      .substring(splitted[1].indexOf("(") + 1, splitted[1].indexOf(","))
      .trim();
  String right = splitted[1]
      .substring(splitted[1].indexOf(",") + 1, splitted[1].indexOf(")"))
      .trim();

  return [base, left, right];
}

HashMap<String, List<String>> getHashMap(List<String> input) {
  HashMap<String, List<String>> toReturn = HashMap();

  for (String line in input) {
    List<String> parsed = parseLine(line);
    toReturn[parsed[0]] = [parsed[1], parsed[2]];
  }

  return toReturn;
}

void main() {
  File file = new File(
      'C:\\Users\\Gebruiker\\development\\PortableVSCode\\data\\code\\leetcode\\adventofcode\\2023\\dec8.txt');
  // ignore: unused_local_variable
  List<String> lines = file.readAsLinesSync();

  List<String> lrCommands = getLRCommands(lines[0]);
  lines.removeRange(0, 2);

  HashMap<String, List<String>> hashmap = getHashMap(lines);

  String currentPlace = "AAA";
  String destination = "ZZZ";
  int steps = 0;
  List<String> commands = List.from(lrCommands);

  while (currentPlace != destination) {
    String command = commands.first;
    commands.removeAt(0);
    if (commands.isEmpty) commands = List.from(lrCommands);
    if (command == "L") {
      currentPlace = hashmap[currentPlace]![0];
    } else {
      currentPlace = hashmap[currentPlace]![1];
    }
    steps++;
  }
  print(steps);
}
