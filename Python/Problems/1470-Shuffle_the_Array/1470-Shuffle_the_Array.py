# LeetCode 1470. Shuffle the Array
# https://leetcode.com/problems/shuffle-the-array/


# Solution #01: 

class Solution(object):
    def shuffle(self, nums, n):
        """
        :type nums: List[int]
        :type n: int
        :rtype: List[int]
        """
        
        nums_shuffled = []
        for i in range(0, n):
            nums_shuffled.append(nums[i])
            nums_shuffled.append(nums[i + n])

        return nums_shuffled


# Solution #02: 

class Solution(object):
    def shuffle(self, nums, n):
        """
        :type nums: List[int]
        :type n: int
        :rtype: List[int]
        """
        
        return [nums[i // 2 + (0 if i % 2 == 0 else n)] for i in range(0, len(nums))]