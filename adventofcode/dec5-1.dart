import 'dart:io';

class Seed {
  int seedId;
  int soil = -1;
  int fertilizer = -1;
  int water = -1;
  int light = -1;
  int temperature = -1;
  int humidity = -1;
  int location = -1;
  Seed(this.seedId);
}

List<Seed> seeds = [];
List<List<int>> seedtoSoil = [];
List<List<int>> soiltoFertilizer = [];
List<List<int>> fertilizerToWater = [];
List<List<int>> waterToLight = [];
List<List<int>> lightToTemperature = [];
List<List<int>> temperatureToHumidity = [];
List<List<int>> humidityToLocation = [];

void fillDatabase() {
  File file = File('dec5.txt');
  List<String> lines = file.readAsLinesSync();
  List<int> seedIds = [];
  for (String seed in lines[0].substring(7).split(" ")) {
    seedIds.add(int.parse(seed));
  }

  while (seedIds.length != 0) {
    print("seedidslength = now ${seedIds.length}");
    print("handling seed ${seedIds[0]}");
    int baseid = seedIds[0];
    for (int i = 0; i < seedIds[1]; i++) {
      seeds.add(Seed(baseid + i));
    }
    seedIds.removeAt(0);
    seedIds.removeAt(0);
  }
  print(" seeds length = ${seeds.length}");

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
  for (Seed seed in seeds) {
    print("handling seed ${seed.seedId}");
    seed.soil = getMapped(seed.seedId, seedtoSoil);
    print("soil: ${seed.soil}");
    seed.fertilizer = getMapped(seed.soil, soiltoFertilizer);
    print("fertilizer: ${seed.fertilizer}");
    seed.water = getMapped(seed.fertilizer, fertilizerToWater);
    print("water: ${seed.water}");
    seed.light = getMapped(seed.water, waterToLight);
    print("light: ${seed.light}");
    seed.temperature = getMapped(seed.light, lightToTemperature);
    print("temperature: ${seed.temperature}");
    seed.humidity = getMapped(seed.temperature, temperatureToHumidity);
    print("humidity: ${seed.humidity}");
    seed.location = getMapped(seed.humidity, humidityToLocation);
    print("location: ${seed.location}");
  }
  int min = 0;
  for (Seed seed in seeds) {
    if (seed.location < seeds[min].location) {
      min = seeds.indexOf(seed);
    }
  }
  print(seeds[min].location);
}
