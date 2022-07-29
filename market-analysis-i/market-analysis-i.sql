# Write your MySQL query statement below
SELECT 
	users.user_id AS buyer_id,
	users.join_date,
	COUNT(orders.order_date) AS orders_in_2019
FROM
	users
LEFT JOIN orders on users.user_id = orders.buyer_id AND
                    orders.order_date BETWEEN '2019-01-01 00:00:00' AND '2019-12-31 23:59:59'
GROUP BY users.user_id;

