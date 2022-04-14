--https://www.hackerrank.com/challenges/challenges/problem?isFullScreen=true

SELECT h.hacker_id, h.name, count(*) as challenges_created
FROM Hackers h
JOIN Challenges c ON h.hacker_id = c.hacker_id
GROUP BY h.hacker_id, h.name
HAVING challenges_created IN (SELECT sub1.challenges_created
                              FROM(SELECT hacker_id, count(*) as challenges_created
                                   FROM Challenges
                                   GROUP BY Challenges.hacker_id) sub1
                              GROUP BY sub1.challenges_created
                              HAVING count(*) = 1)
    OR challenges_created = (SELECT MAX(subM.challenges_created)
                             FROM(SELECT count(*) as challenges_created
                                  FROM Challenges
                                  GROUP BY Challenges.hacker_id) subM)
ORDER BY challenges_created DESC, h.hacker_id
