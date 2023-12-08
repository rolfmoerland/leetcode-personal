from typing import List


class Solution:
    def findDiagonalOrder(self, nums: List[List[int]]) -> List[int]:
        offset = []
        for y in range(0, len(nums)):
            for x in range(0, len(nums)):
                if(len(offset) <= (x+y)):
                    offset.append([nums[y][x]])
                else:
                    offset[y+x].append(nums[y][x])
        toReturn = []
        for l in offset:
            for i in range(len(l), 0, -1):
                toReturn.append(i)
        return toReturn

        
