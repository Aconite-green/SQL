# Write your MySQL query statement below
SELECT 
    user_id,
    CONCAT(SUBSTR(UPPER(name), 1, 1),SUBSTR(LOWER(name), 2, length(name))) AS name
FROM users
ORDER BY user_id
