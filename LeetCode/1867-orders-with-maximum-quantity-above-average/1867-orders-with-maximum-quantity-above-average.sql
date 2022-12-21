# Write your MySQL query statement below


SELECT order_id FROM OrdersDetails GROUP BY order_id
HAVING MAX(quantity) > (SELECT AVG(quantity) FROM OrdersDetails GROUP BY order_id ORDER BY 1 DESC LIMIT 1)