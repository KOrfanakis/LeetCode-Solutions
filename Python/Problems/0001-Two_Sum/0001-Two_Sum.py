# LeetCode 1. Two Sum
# https://leetcode.com/problems/two-sum/


# Solution #01: Using Brute Force

class Solution(object):
    def twoSum(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: List[int]
        """
        
        for i in range(0, len(nums) - 1):
            for j in range(i + 1, len(nums)):
                if nums[i] + nums[j] == target:
                    return [i, j]


# Solution #02: Solving it in One-pass

class Solution(object):
    def twoSum(self, nums, target):
        """
        :type nums: List[int]
        :type target: int
        :rtype: List[int]
        """
        
        nums_dict = {}
        for idx, num in enumerate(nums):
            if target - num in nums_dict.keys():
                return [nums_dict[target - num], idx]

            nums_dict[num] = idx


# nums = [0, 1, 2, 7, 11, 15]
# target = 9

# s = Solution()
# print(s.twoSum(nums, target))