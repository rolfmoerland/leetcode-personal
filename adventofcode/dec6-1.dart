/*

Time:        48     98     90     83
Distance:   390   1103   1112   1360


*/

// List<List<int>> input = [
//   [7, 9],
//   [15, 40],
//   [30, 200]
// ];

List<List<int>> input = [
  [48, 390],
  [98, 1103],
  [90, 1112],
  [83, 1360]
];

void main() {
  int toreturn = getDifference(getRangePossible(input[0][0], input[0][1]));
  for (int i = 1; i < input.length; i++) {
    toreturn *= getDifference(getRangePossible(input[i][0], input[i][1]));
  }
  print(toreturn);
}

int getDistance(int charge, int totalTime) {
  return (totalTime - charge) * charge;
}

bool getDistanceHigherThanTarget(int chargeTime, int totalTime, int distance) {
  return getDistance(chargeTime, totalTime) > distance;
}

List<int> getRangePossible(int time, int distance) {
  bool findFirst = true;
  int first = -1;
  int last = -1;
  for (int i = 0; i < time; i++) {
    if (findFirst) {
      if (getDistanceHigherThanTarget(i, time, distance)) {
        findFirst = false;
        first = i;
      }
    } else {
      if (!getDistanceHigherThanTarget(i, time, distance)) {
        last = i - 1;
        i = time;
      }
    }
  }
  return [first, last];
}

int getDifference(List<int> input) {
  return (input[1] - input[0]) + 1;
}
