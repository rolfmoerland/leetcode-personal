/*

Time:        48989083
Distance:   390110311121360


*/


void main() {
  print(getDifference(getRangePossible(48989083, 390110311121360)));
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
