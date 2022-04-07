# LeetCode 1313. Decompress Run-Length Encoded List
# https://leetcode.com/problems/decompress-run-length-encoded-list/


# Solution #01: Two for-loops (for undestanding)

class Solution(object):
    def decompressRLElist(self, nums):
        """
        :type nums: List[int]
        :rtype: List[int]
        """
        
        nums_decomp = []
        for i in range(0, len(nums), 2):
            freq = nums[i]
            for _ in range(0, freq):
                val = nums[i + 1]
                nums_decomp.append(val)

        return nums_decomp


# Solution #02: Using the extend() method

class Solution(object):
    def decompressRLElist(self, nums):
        """
        :type nums: List[int]
        :rtype: List[int]
        """

        nums_decomp = []
        for i in range(0, len(nums), 2):
            nums_decomp.extend(nums[i] * [nums[i + 1]])

        return nums_decomp