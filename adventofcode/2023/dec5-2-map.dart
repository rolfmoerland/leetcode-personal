import 'dart:io';
import 'dart:math';

List<int> seeds = [];
List<int> seedIds = [];

Map<int, int> seedToSoilMap = Map();
Map<int, int> soilToFertilizerMap = Map();
Map<int, int> fertilizerToWaterMap = Map();
Map<int, int> waterToLightMap = Map();
Map<int, int> lightToTemperatureMap = Map();
Map<int, int> temperatureToHumidityMap = Map();
Map<int, int> humidityToLocationMap = Map();

void fillDatabase() {
  File file = File('dec5.txt');
  List<String> lines = file.readAsLinesSync();
  for (String seed in lines[0].substring(7).split(" ")) {
    seedIds.add(int.parse(seed));
  }

  void handleLine(String startswith, Map<int, int> destination) {
    lines.removeAt(0);
    while (!lines[0].startsWith(startswith)) {
      lines.removeAt(0);
    }
    lines.removeAt(0);
    while (lines.length != 0 && lines[0] != "") {
      List<String> line = lines[0].split(" ");

      int destStart = int.parse(line[0]);
      int srcStart = int.parse(line[1]);
      int len = int.parse(line[2]);

      print(
          "handling the next line: deststart = $destStart, srcstart = $srcStart, len = $len");

      // Line is [dest start, source start, length]
      for (int i = srcStart; i < srcStart + len; i++) {
        destination[i] = destStart + (i - srcStart);
      }

      lines.removeAt(0);
    }
  }

  handleLine("seed-to-soil", seedToSoilMap);
  handleLine("soil-to-fertilizer", soilToFertilizerMap);
  handleLine("fertilizer-to-water", fertilizerToWaterMap);
  handleLine("water-to-light", waterToLightMap);
  handleLine("light-to-temperature", lightToTemperatureMap);
  handleLine("temperature-to-humidity", temperatureToHumidityMap);
  handleLine("humidity-to-location", humidityToLocationMap);
}

void makeMaps() {}

void main() {
  fillDatabase();

  int minLocation = pow(2, 53).toInt();

  int getMapped(int number, Map<int, int> map) {
    return map[number] ?? number;
  }

  while (seedIds.isNotEmpty) {
    int toGoTo = seedIds[0] + seedIds[1];
    print("handling $toGoTo cases after ${seedIds[0]}");
    for (int i = seedIds[0]; i < toGoTo; i++) {
      int soil = getMapped(i, seedToSoilMap);
      int fertilizer = getMapped(soil, soilToFertilizerMap);
      int water = getMapped(fertilizer, fertilizerToWaterMap);
      int light = getMapped(water, waterToLightMap);
      int temperature = getMapped(light, lightToTemperatureMap);
      int humidity = getMapped(temperature, temperatureToHumidityMap);
      int location = getMapped(humidity, humidityToLocationMap);

      if (location < minLocation) {
        minLocation = location;
        print("new lowest is $location");
      }
    }
    seedIds.removeAt(0);
    seedIds.removeAt(0);
    print(seedIds.length);
  }
  print(minLocation);
}
