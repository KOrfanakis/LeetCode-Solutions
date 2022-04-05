# 11. Container With Most Water

## Description

You are given an integer array `height` of length `n`. There are `n` vertical lines drawn such that the two endpoints of the `ith` line are `(i, 0)` and `(i, height[i])`.

Find two lines that together with the x-axis form a container, such that the container contains the most water.

Return *the maximum amount of water a container can store*.

**Notice** that you may not slant the container.

<br>

## Constraints:

- `n == height.length`
- 2 <= `n` <= 10<sup>5</sup>
- 0 <= `height[i]` <= 10<sup>4</sup>

<br>

## Solution

```python
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
```

<br>

## Examples

### Example #01:

**Input**: `height = [1,8,6,2,5,4,8,3,7]`

**Output**: 49

**Explanation**: 

The above vertical lines are represented by array `[1,8,6,2,5,4,8,3,7]`. In this case, the max area of water (blue section) the container can contain is 49.

<br>

### Example #02:

**Input**: `height = [1,1]`

**Output**: 1
