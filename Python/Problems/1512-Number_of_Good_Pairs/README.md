# 1512. Number of Good Pairs

## Description

Given an array of integers `nums`, return the number of good pairs. A pair `(i, j)` is called good if `nums[i] == nums[j]` and `i < j`.

<br>

## Constraints:

- `1 <= nums.length <= 100`
- `1 <= nums[i] <= 100`

<br>

## Solutions 

### Solution #01: Using a Dictionary

```python
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
```

<br>

### Solution #02: Using a List Comprehension

```python
class Solution(object):
    def numIdenticalPairs(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """

        return len([(i, j) for i in range(len(nums) - 1) for j in range(i + 1, len(nums)) if nums[i] == nums[j]])
```

<br>

## Examples

### Example 1:

**Input**: `nums = [1,2,3,1,1,3]`

**Output**: 4

**Explanation**: There are 4 good pairs (0,3), (0,4), (3,4), (2,5) 0-indexed.

<br>

### Example 2:

**Input**: `nums = [1,1,1,1]`

**Output**: 6

**Explanation**: Each pair in the array are good.

<br>

### Example 3:

**Input**: nums = [1,2,3]

**Output**: 0
