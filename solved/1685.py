from typing import List


class Solution:
    def getSumAbsoluteDifferences(self, nums: List[int]) -> List[int]:
        toReturn = []
        i = 0
        while(i < len(nums)):
            absbuilder = 0
            for num in nums:
                absbuilder += abs(nums[i] - num)
            toReturn.append(absbuilder)
            i += 1
        return toReturn 