# 1313. Decompress Run-Length Encoded List

## Description

We are given a list `nums` of integers representing a list compressed with run-length encoding.

Consider each adjacent pair of elements `[freq, val] = [nums[2*i], nums[2*i+1]]` (with `i >= 0`). 
For each such pair, there are `freq` elements with value `val` concatenated in a sublist. 
Concatenate all the sublists from left to right to generate the decompressed list.

Return the decompressed list.

<br>

## Constraints

- `2 <= nums.length <= 100`
- `nums.length % 2 == 0`
- `1 <= nums[i] <= 100`

<br>

## Solutions

### Solution #01: Two for-loops (for undestanding)

```python
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
```

<br>

### Solution #02: Using the `extend()` method

```python
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
```

<br>

## Examples

### Example #01:

**Input**: `nums = [1,2,3,4]`

**Output**: `[2,4,4,4]`

**Explanation**: The first pair `[1,2]` means we have `freq = 1` and `val = 2` so we generate the array `[2]`.
The second pair `[3,4]` means we have `freq = 3` and `val = 4` so we generate `[4,4,4]`.
At the end the concatenation `[2] + [4,4,4]` is `[2,4,4,4]`.

<br>

### Example #02:

**Input**: `nums = [1,1,2,3]`

**Output**: `[1,3,3]`
