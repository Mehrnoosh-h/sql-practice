
/*
579. Find Cumulative Salary of an Employee

Table: Employee
+-------------+------+  
| Column Name | Type |  
+-------------+------+  
| id          | int  |  
| month       | int  |  
| salary      | int  |  
+-------------+------+  
(id, month) is the primary key for this table.  
Each row in the table indicates the salary of an employee in one month during the year 2020.
Write an SQL query to calculate the cumulative salary summary for every employee in a single unified table.

The cumulative salary summary for an employee can be calculated as follows:

For each month that the employee worked, sum up the salaries in that month and the previous two months. 
This is their 3-month sum for that month. If an employee did not work for the company in previous months, 
their effective salary for those months is 0.
Do not include the 3-month sum for the most recent month that the employee worked for in the summary.
Do not include the 3-month sum for any month the employee did not work.
Return the result table ordered by id in ascending order. In case of a tie, order it by month in descending order.

Input: 
Employee table:
+----+-------+--------+
| id | month | salary |
+----+-------+--------+
| 1  | 1     | 20     |
| 2  | 1     | 20     |
| 1  | 2     | 30     |
| 2  | 2     | 30     |
| 3  | 2     | 40     |
| 1  | 3     | 40     |
| 3  | 3     | 60     |
| 1  | 4     | 60     |
| 3  | 4     | 70     |
| 1  | 7     | 90     |
| 1  | 8     | 90     |
+----+-------+--------+
Output: 
+----+-------+--------+
| id | month | Salary |
+----+-------+--------+
| 1  | 7     | 90     |
| 1  | 4     | 130    |
| 1  | 3     | 90     |
| 1  | 2     | 50     |
| 1  | 1     | 20     |
| 2  | 1     | 20     |
| 3  | 3     | 100    |
| 3  | 2     | 40     |
+----+-------+--------+
 */

WITH all_together AS (
    SELECT 
        e1.id,
        e1.month,
        e1.salary AS salary1,
        COALESCE(e2.salary, 0) AS salary2,   -- month - 1
        COALESCE(e3.salary, 0) AS salary3    -- month - 2
    FROM Employee e1
    LEFT JOIN Employee e2
        ON e1.id = e2.id
       AND e2.month = e1.month - 1
    LEFT JOIN Employee e3
        ON e1.id = e3.id
       AND e3.month = e1.month - 2
),
last_month AS (
    SELECT id, MAX(month) AS max_month
    FROM Employee
    GROUP BY id
)
SELECT 
    a.id,
    a.month,
    (a.salary1 + a.salary2 + a.salary3) AS Salary
FROM all_together a
JOIN last_month l
  ON a.id = l.id
WHERE a.month <> l.max_month        -- exclude the most recent month
ORDER BY a.id ASC, a.month DESC;

