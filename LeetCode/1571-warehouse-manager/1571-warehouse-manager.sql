# Write your MySQL query statement below
SELECT
    w.name AS warehouse_name,
    SUM(IF(p.product_id = w.product_id, p.Width*p.Length*p.Height*w.units,0)) AS volume
FROM Warehouse w
LEFT JOIN Products p ON w.product_id = p.product_id
GROUP BY warehouse_name