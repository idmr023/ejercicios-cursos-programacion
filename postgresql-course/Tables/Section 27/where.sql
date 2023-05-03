-- SELECT pfirstname FROM people WHERE pstate = 'NY';
SELECT pstate, COUNT(pstate) AS "total" FROM people GROUP BY pstate ORDER BY total;