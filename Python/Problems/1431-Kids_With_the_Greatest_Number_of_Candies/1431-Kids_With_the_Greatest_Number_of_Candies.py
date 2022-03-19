# LeetCode 1431. Kids With the Greatest Number of Candies
# https://leetcode.com/problems/kids-with-the-greatest-number-of-candies/submissions/


class Solution(object):
    def kidsWithCandies(self, candies, extraCandies):
        """
        :type candies: List[int]
        :type extraCandies: int
        :rtype: List[bool]
        """
        
        return [True if candy + extraCandies >= max(candies) else False for candy in candies]

# candies = [2, 3, 5, 1, 3]
# extraCandies = 3

# s = Solution()
# print(s.kidsWithCandies(candies, extraCandies))