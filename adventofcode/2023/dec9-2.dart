import 'dart:io';

List<List<List<String>>> input = [];

void main() {
  File file = new File(
      'C:\\Users\\Gebruiker\\development\\PortableVSCode\\data\\code\\leetcode\\adventofcode\\2023\\dec9ex.txt');
  // ignore: unused_local_variable
  List<String> lines = file.readAsLinesSync();
  List<List<int>> importedlines = [];
  importtoLines(importedlines, lines);

  List<List<List<int>>> input = [];
  for (List<int> importedLine in importedlines) {
    input.add([importedLine]);
  }

  // input is now
  //[
  // [
  //  [12, 15, 18, 21, 24, 27, 30]
  // ],
  // [
  //  [12, 15, 18, 21, 24, 27, 30]
  // ]
  // ....
  //]

  for (List<List<int>> inputCase in input) {
    listIntExpandToZeroes(inputCase);
  }

  for (List<List<int>> inputCase in input) {
    extrapolateLine(inputCase);
  }

  int toReturn = 0;

  for (List<List<int>> inputCase in input) {
    print(inputCase[0].last);
    toReturn += inputCase[0].last;
  }
  print(toReturn);
}

void importtoLines(List<List<int>> input, List<String> lines) {
  for (String line in lines) {
    List<String> temp = line.split(" ");
    List<int> toadd = [];
    for (String str in temp) {
      toadd.add(int.parse(str));
    }
    input.add(toadd);
  }
}

void listIntExpandToZeroes(List<List<int>> inputCase) {
  bool onlyEncounteredZeroes = false;
  while (!onlyEncounteredZeroes) {
    onlyEncounteredZeroes = true;
    List<int> parent = inputCase.last;
    List<int> iteration = [];
    for (int i = 1; i < parent.length; i++) {
      iteration.add(parent[i] - parent[i - 1]);
      if (iteration.last != 0) onlyEncounteredZeroes = false;
    }
    inputCase.add(iteration);
  }
}

void extrapolateLine(List<List<int>> inputCase) {
  inputCase.last.insert(0, 0);
  for (int i = inputCase.length - 2; i >= 0; i--) {
    inputCase[i].insert(0, inputCase[i + 1].first + inputCase[i].first);
  }
}
