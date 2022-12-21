SELECT DISTINCT Salary AS SecondHighestSalary 
FROM Employee 

UNION ALL 

(SELECT null AS Salary)

ORDER BY SecondHighestSalary DESC 
LIMIT 1 OFFSET 1