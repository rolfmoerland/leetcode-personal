import 'dart:math';

void main() {
    Solution().main();
}

class Solution {
  
  void main(){
    print(findDifferentBinaryString(["1"]));
  }

  String findDifferentBinaryString(List<String> nums) {
   int charCount = nums[0].length;

   int max = pow(2, charCount).toInt();
   int min = pow(2, charCount-1).toInt();
   if(min < 2) {
    min = 0;
   }

   //SplayTreeSet<int> set = SplayTreeSet<int>((a, b) => a.compareTo(b));
    Set<int> set = Set();

   for(String num in nums) {
    set.add(int.parse(num, radix: 2));
   }

   if(!(set.contains(0))) {
        String toreturn = '';
        for(int i = 0; i<charCount; i++) {
            toreturn += "0";
        }
        return toreturn;
    }

   for(int i = min; i < max; i++) {
    if(!(set.contains(i))) {
        return i.toRadixString(2);
    }
   }
   return "";
  }

}