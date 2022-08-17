# Write your MySQL query statement below
SELECT s.seller_name FROM Seller s
LEFT JOIN Orders o ON s.seller_id = o.seller_id AND
          YEAR(sale_date) = '2020'
WHERE o.seller_id IS NULL
ORDER BY s.seller_name

