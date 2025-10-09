/*571. Find Median Given Frequency of Numbers
Hard
The Numbers table keeps the value of number and its frequency.

+----------+-------------+
|  Number  |  Frequency  |
+----------+-------------|
|  0       |  7          |
|  1       |  1          |
|  2       |  3          |
|  3       |  1          |
+----------+-------------+
In this table, the numbers are 0, 0, 0, 0, 0, 0, 0, 1, 2, 2, 2, 3, so the median is (0 + 0) / 2 = 0.

+--------+
| median |
+--------|
| 0.0000 |
+--------+
Write a query to find the median of all numbers and name the result as median.
*/



select Number
from Numbers
order by Number
limit 1 offset 
(select sum(Frequency) from Numbers) / 2

















SELECT
    AVG(Number * 1.0) AS median
FROM (
    SELECT Number
    FROM Numbers
    ORDER BY Number
    LIMIT 1 OFFSET (
        (SELECT SUM(Frequency) FROM Numbers) / 2
    )
) AS t;
