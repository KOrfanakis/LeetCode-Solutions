# 1484. Group Sold Products By The Date

## Description

Table `Activities`:
```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| sell_date   | date    |
| product     | varchar |
+-------------+---------+
```
There is no primary key for this table, it may contain duplicates.
Each row of this table contains the product name and the date it was sold in a market.

 <br>

Write an SQL query to find for each date the number of different products sold and their names.
The sold products names for each date should be sorted lexicographically.
Return the result table ordered by `sell_date`.

<br>

## Solution

```sql
SELECT
    sell_date,
    COUNT(DISTINCT(product)) AS 'num_sold',
    GROUP_CONCAT(DISTINCT product) AS 'products'
FROM Activities
GROUP BY sell_date
ORDER BY sell_date, product;
```

<br>

## Example

**Input**:

`Users` table:
```
+---------+-------+
| user_id | name  |
+---------+-------+
| 1       | aLice |
| 2       | bOB   |
+---------+-------+
```
**Output**:
```
+---------+-------+
| user_id | name  |
+---------+-------+
| 1       | Alice |
| 2       | Bob   |
+---------+-------+
```

**Explanation**: 
- For `2020-05-30`, Sold items were (Headphone, Basketball, T-shirt), we sort them lexicographically and separate them by a comma.
- For `2020-06-01`, Sold items were (Pencil, Bible), we sort them lexicographically and separate them by a comma.
- For `2020-06-02`, the Sold item is (Mask), we just return it.
