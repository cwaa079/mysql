--https://www.hackerrank.com/challenges/harry-potter-and-wands/problem?isFullScreen=true
--ㅇㅏㄴㅣ ㄱㅡㄹㅐㅅㅓ ㅎㅏㄴㄱㅡㄹ ㅗㅇㅐ ㅇㅏㄴㄷㅗㅣㅁ

SELECT W.id, P.age, W.coins_needed, W.power
FROM (SELECT code, MIN(coins_needed) as coins_needed, power
      FROM Wands
      GROUP BY code, power) as M
JOIN Wands W ON M.code = W.code AND M.coins_needed = W.coins_needed AND M.power = W.power
JOIN Wands_Property P ON W.code = P.code
WHERE P.is_evil = 0
ORDER BY W.power DESC, P.age DESC
