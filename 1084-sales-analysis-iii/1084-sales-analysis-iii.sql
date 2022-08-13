# Write your MySQL query statement below
select s.product_id, p.product_name
from sales s, product p
WHERE s.product_id = p.product_id
GROUP BY s.product_id, p.product_name
HAVING MIN(s.sale_date) >= '2019-01-01' 
    AND MAX(s.sale_date) <= '2019-03-31'

      
      