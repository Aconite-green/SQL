# Write your MySQL query statement below
SELECT c.customer_id, c.customer_name 
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id
having sum(o.product_name="A") >0 and sum(o.product_name="B") > 0 and sum(o.product_name="C")=0

                   
                   
                   
