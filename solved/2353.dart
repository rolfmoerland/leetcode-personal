//import 'dart:math';

import 'dart:collection';

void main() {
  FoodRatings foodRatings = new FoodRatings(
      ["kimchi", "miso", "sushi", "moussaka", "ramen", "bulgogi"],
      ["korean", "japanese", "japanese", "greek", "japanese", "korean"],
      [9, 12, 8, 15, 14, 7]);
  print(foodRatings.highestRated(
      "korean")); // return "kimchi"// "kimchi" is the highest rated korean food with a rating of 9.
  print(foodRatings.highestRated(
      "japanese")); // return "ramen"// "ramen" is the highest rated japanese food with a rating of 14.
  foodRatings.changeRating("sushi", 16); // "sushi" now has a rating of 16.
  print(foodRatings.highestRated(
      "japanese")); // return "sushi"// "sushi" is the highest rated japanese food with a rating of 16.
  foodRatings.changeRating("ramen", 16); // "ramen" now has a rating of 16.
  print(foodRatings.highestRated("japanese")); // return "ramen"
  // Both "sushi" and "ramen" have a rating of 16.
  // However, "ramen" is lexicographically smaller than "sushi".
}

class FoodRatings {
  Map<String, String> foodToCuisine = {};
  Map<String, int> foodToRating = {};
  Map<String, SplayTreeMap<int, Set<String>>> cuisineToRatings = {};

  FoodRatings(List<String> foods, List<String> cuisines, List<int> ratings) {
    for (int i = 0; i < foods.length; i++) {
      String food = foods[i];
      String cuisine = cuisines[i];
      int rating = ratings[i];

      foodToCuisine[food] = cuisine;
      foodToRating[food] = rating;

      cuisineToRatings.putIfAbsent(
          cuisine, () => SplayTreeMap<int, Set<String>>());
      var ratingsSet = cuisineToRatings[cuisine]!;
      ratingsSet.putIfAbsent(rating, () => Set<String>());
      ratingsSet[rating]!.add(food);
    }
  }

  void changeRating(String food, int newRating) {
    String cuisine = foodToCuisine[food]!;
    int currentRating = foodToRating[food]!;
    foodToRating[food] = newRating;

    // Update the ratings map
    var ratingsSet = cuisineToRatings[cuisine]!;
    ratingsSet[currentRating]!.remove(food);
    if (ratingsSet[currentRating]!.isEmpty) {
      ratingsSet.remove(currentRating);
    }
    ratingsSet.putIfAbsent(newRating, () => Set<String>());
    ratingsSet[newRating]!.add(food);
  }

  String highestRated(String cuisine) {
    var ratingsMap = cuisineToRatings[cuisine]!;
    var highestRating = ratingsMap.lastKey();
    return ratingsMap[highestRating]!
        .reduce((a, b) => a.compareTo(b) < 0 ? a : b);
  }
}

class Solution {
  void main() {
    print(""
        //
        );
  }
}
