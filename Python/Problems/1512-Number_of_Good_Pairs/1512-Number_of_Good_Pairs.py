# LeetCode 1512. Number of Good Pairs
# https://leetcode.com/problems/number-of-good-pairs/


# Solution #01: Using a Dictionary

class Solution(object):
    def numIdenticalPairs(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        
        nums_dict = dict()
        for num in nums:
            if num in nums_dict:
                nums_dict[num] += 1
            else:
                nums_dict[num] = 1

        count = 0
        for num in nums_dict:
            if nums_dict[num] > 1:
                count += nums_dict[num] * (nums_dict[num] - 1) / 2

        return int(count)


# Solution #02: Using a List Comprehension

class Solution(object):
    def numIdenticalPairs(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """

        return len([(i, j) for i in range(len(nums) - 1) for j in range(i + 1, len(nums)) if nums[i] == nums[j]])


# nums = [1, 2, 3, 1, 1, 3]
# nums = [1, 1, 1, 1]
# nums = [1, 2, 3]

# s = Solution()
# print(s.numIdenticalPairs(nums))