SELECT pfirstname, plastname, ppoints, pdob
FROM people
WHERE ppoints NOT BETWEEN 250 AND 750
ORDER BY ppoints ASC;