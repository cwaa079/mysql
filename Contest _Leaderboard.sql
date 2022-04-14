--https://www.hackerrank.com/challenges/contest-leaderboard/problem?isFullScreen=true
--서브쿼리

SELECT Hackers.hacker_id, Hackers.name, sub2.total_score
FROM(SELECT sub.hacker_id, sum(sub.max_score) as total_score
     FROM(SELECT hacker_id, challenge_id, MAX(score) as max_score
          FROM Submissions
          GROUP BY hacker_id, challenge_id) sub
    GROUP BY sub.hacker_id
    HAVING total_score != 0) sub2
INNER JOIN Hackers ON Hackers.hacker_id = sub2.hacker_id
ORDER BY sub2.total_score DESC, Hackers.hacker_id
