/* Write your T-SQL query statement below */
SELECT
    tweet_id
FROM tweets
WHERE len(content) > 15