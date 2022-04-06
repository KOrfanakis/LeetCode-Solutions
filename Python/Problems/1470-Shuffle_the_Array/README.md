# 1470. Shuffle the Array

## Description

Given the array `nums` consisting of `2n` elements in the form `[x1, x2, ..., xn, y1, y2, ..., yn]`.

Return the array in the form `[x1, y1, x2, y2, ..., xn, yn]`.

<br>

## Constraints

- `1 <= n <= 500`
- `nums.length == 2n`
- `1 <= nums[i] <= 10^3`


<br>

## Solutions

### Solution #01:

```python
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
```
<br>

### Solution #02:

```python
class Solution(object):
    def shuffle(self, nums, n):
        """
        :type nums: List[int]
        :type n: int
        :rtype: List[int]
        """
        
        return [nums[i // 2 + (0 if i % 2 == 0 else n)] for i in range(0, len(nums))]
```

<br>

## Examples

### Example #01:

**Input**: `nums = [2,5,1,3,4,7]`, `n = 3`

**Output**: `[2,3,5,4,1,7]`

<br>

### Example #02:

**Input**: `nums = [1,2,3,4,4,3,2,1]`, `n = 4`

**Output**: `[1,4,2,3,3,2,4,1]`

<br>

### Example #03:

**Input**: `nums = [1,1,2,2]`, `n = 2`

**Output**: `[1,2,1,2]`
