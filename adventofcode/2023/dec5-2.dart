import 'dart:io';
import 'dart:math';

List<int> seeds = [];
List<int> seedIds = [];

List<List<int>> seedtoSoil = [];
List<List<int>> soiltoFertilizer = [];
List<List<int>> fertilizerToWater = [];
List<List<int>> waterToLight = [];
List<List<int>> lightToTemperature = [];
List<List<int>> temperatureToHumidity = [];
List<List<int>> humidityToLocation = [];

void fillDatabase() {
  File file = File('dec5exmp.txt');
  List<String> lines = file.readAsLinesSync();
  for (String seed in lines[0].substring(7).split(" ")) {
    seedIds.add(int.parse(seed));
  }

  void handleLine(String startswith, List<List<int>> destination) {
    lines.removeAt(0);
    while (!lines[0].startsWith(startswith)) {
      lines.removeAt(0);
    }
    lines.removeAt(0);
    while (lines.length != 0 && lines[0] != "") {
      List<String> line = lines[0].split(" ");
      destination
          .add([int.parse(line[0]), int.parse(line[1]), int.parse(line[2])]);
      lines.removeAt(0);
    }
  }

  handleLine("seed-to-soil", seedtoSoil);
  handleLine("soil-to-fertilizer", soiltoFertilizer);
  handleLine("fertilizer-to-water", fertilizerToWater);
  handleLine("water-to-light", waterToLight);
  handleLine("light-to-temperature", lightToTemperature);
  handleLine("temperature-to-humidity", temperatureToHumidity);
  handleLine("humidity-to-location", humidityToLocation);
}

int getMapped(int number, List<List<int>> map) {
  for (List<int> line in map) {
    if (number > line[1] && number < line[1] + line[2]) {
      // We got a case.
      return line[0] + (number - line[1]);
    }
  }
  return number;
}

void main() {
  fillDatabase();
  print(seedIds);
  int minLocation = pow(2, 53).toInt();
  while (seedIds.isNotEmpty) {
    int toGoTo = seedIds[0] + seedIds[1];
    for (int i = seedIds[0]; i < toGoTo; i++) {
      int location = getMapped(
          getMapped(
              getMapped(
                  getMapped(
                      getMapped(
                          getMapped(getMapped(i, seedtoSoil), soiltoFertilizer),
                          fertilizerToWater),
                      waterToLight),
                  lightToTemperature),
              temperatureToHumidity),
          humidityToLocation);

      if (location < minLocation) {
        minLocation = location;
      }
    }
    seedIds.removeAt(0);
    seedIds.removeAt(0);
    print(seedIds.length);
  }
  print(minLocation);
}
