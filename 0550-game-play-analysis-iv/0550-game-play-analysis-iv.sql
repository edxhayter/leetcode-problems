/* Write your T-SQL query statement below */
-- Write your PostgreSQL query statement below
WITH initial_login AS (
SELECT
    player_id,
    MIN(event_date) AS initial_login
FROM activity
GROUP BY player_id
)

SELECT 
COALESCE(ROUND(CAST(SUM(CASE WHEN a.player_id IS NOT NULL THEN 1 END) AS numeric)
/
CAST(COUNT(DISTINCT i.player_id) AS numeric), 2), 0) AS fraction
FROM initial_login as i
LEFT JOIN activity as a ON DATEADD(day, 1, initial_login) = a.event_date AND a.player_id = i.player_id