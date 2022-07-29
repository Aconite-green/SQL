# Write your MySQL query statement below
SELECT visits.customer_id,
COUNT(visits.visit_id) as count_no_trans
FROM visits
LEFT JOIN transactions on visits.visit_id = transactions.visit_id
WHERE transactions.visit_id is NULL
GROUP BY visits.customer_id;
