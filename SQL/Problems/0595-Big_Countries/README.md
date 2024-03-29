# 595. Big Countries

## Description

Table: `World`
```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| name        | varchar |
| continent   | varchar |
| area        | int     |
| population  | int     |
| gdp         | int     |
+-------------+---------+
```
`name` is the primary key column for this table. Each row of this table gives information about the name of a country, the continent to which it belongs, its area, the population, and its GDP value.

<br>
 
A country is big if:

- it has an area of at least three million (i.e., 3,000,000 km<sup>2</sup>), or
- it has a population of at least twenty-five million (i.e., 25,000,000).

Write an SQL query to report the name, population, and area of the big countries. Return the result table in **any order**.

<br>

## Solution

```sql
SELECT name, population, area
FROM World
WHERE
    area >= 3000000 OR
    population >= 25000000;
```

<br>

## Example

**Input**:

`World` table:
```
+-------------+-----------+---------+------------+--------------+
| name        | continent | area    | population | gdp          |
+-------------+-----------+---------+------------+--------------+
| Afghanistan | Asia      | 652230  | 25500100   | 20343000000  |
| Albania     | Europe    | 28748   | 2831741    | 12960000000  |
| Algeria     | Africa    | 2381741 | 37100000   | 188681000000 |
| Andorra     | Europe    | 468     | 78115      | 3712000000   |
| Angola      | Africa    | 1246700 | 20609294   | 100990000000 |
+-------------+-----------+---------+------------+--------------+
```
**Output**:
```
+-------------+------------+---------+
| name        | population | area    |
+-------------+------------+---------+
| Afghanistan | 25500100   | 652230  |
| Algeria     | 37100000   | 2381741 |
+-------------+------------+---------+
```
