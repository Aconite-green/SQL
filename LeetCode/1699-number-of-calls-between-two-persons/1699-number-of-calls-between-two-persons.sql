# Write your MySQL query statement below
select IF(from_id < to_id, from_id,to_id) as person1,IF(from_id < to_id, to_id,from_id) as person2
, COUNT(*) as call_count,
 SUM(duration) as total_duration
FROM Calls
 GROUP BY person1,person2;

    