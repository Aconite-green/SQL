# Write your MySQL query statement below


(SELECT name AS results FROM users u
JOIN MovieRating mr ON u.user_id = mr.user_id
GROUP BY name
ORDER BY COUNt(rating) DESC, name ASC 
LIMIT 1)
UNION
(SELECT title AS results FROM Movies m
JOIN MovieRating mr ON m.movie_id = mr.movie_id
WHERE MONTH(created_at) = 2
GROUP BY title
ORDER BY AVG(rating) DESC, title ASC
LIMIT 1)