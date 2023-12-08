from typing import List



class Solution:

    def minPairSum(self, nums: List[int]) -> int:
        nums.sort()
        toReturn = 0
        while(nums != []):
            higher = nums.pop() + nums.pop(0)
            if(higher > toReturn):
                toReturn = higher
        return toReturn
    
