# LeetCode 11. Container With Most Water
# https://leetcode.com/problems/container-with-most-water/


# Algorithm: Use two pointers to shrink the left and right (x-axis) range and find the maximum area (i.e. the maximum amount of water).
# Steps:
# 1) Initialise max_area variable to zero, left, right pointers to 0, len(height) - 1
# 2) Use a while loop to loop through the height list
# 3) Calculate the area and compare to max_area
# 4) Update pointers: left++ if height[left] < height[right] else right--

class Solution(object):
    def maxArea(self, height):
        """
        :type height: List[int]
        :rtype: int
        """
           
        max_area = 0
        left, right = 0, len(height) - 1
        while left < right:
            area = (right - left) * min(height[left], height[right])
            max_area = max(max_area, area)
            if height[left] < height[right]:
                left += 1
            else:
                right -= 1
        return max_area