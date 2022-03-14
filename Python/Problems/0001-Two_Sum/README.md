# 1. Two Sum

## Description

Given an array of integers `nums` and an integer `target`, return *indices of the two numbers such that they add up to* `target`.

You may assume that each input would have **exactly one solution**, and you may not use the *same* element twice.

You can return the answer in any order.

<br>

## Constraints:

- 2 <= `nums.length` <= 10<sup>4</sup>
- -10<sup>9</sup> <= `nums[i]` <= 10<sup>9</sup>
- -10<sup>9</sup> <= `target` <= 10<sup>9</sup>
- **Only one valid answer exists**.

<br>

## Solutions

### Solution #01: Using Brute Force

```python
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
```

### Solution #02: Solving it in One-pass

```python
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
```

<br>

## Examples

### Example 1:

**Input**: `nums = [2,7,11,15]`, `target = 9`

**Output**: `[0,1]`

**Explanation**: Because `nums[0] + nums[1] == 9`, we return `[0, 1]`.

### Example 2:

**Input**: `nums = [3,2,4]`, `target = 6`

**Output**: `[1,2]`

### Example 3:

**Input**: `nums = [3,3]`, `target = 6`

**Output**: `[0,1]`
