-- Exercise #1
-- SELECT pfirstname, plastname, ppoints FROM people WHERE ppoints >= 5000;
-- Exercise #2
-- SELECT pfirstname, plastname, ppoints, pstate FROM people WHERE ppoints >= 9500 OR pstate = 'NY'; 
-- Exercise #3
-- SELECT pfirstname, plastname, ppoints, pstate FROM people WHERE ppoints >= 7000 AND pstate = 'NY';
-- Exercise #4
-- SELECT pfirstname, plastname, ppoints, pstate FROM people WHERE ppoints >= 7000 AND pstate NOT ('NY');
-- SELECT pfirstname, plastname, ppoints, pstate FROM people WHERE ppoints >= 7000 AND pstate <> 'NY';
-- Exercise #5
-- SELECT pfirstname, plastname, pdob 
-- FROM people
-- WHERE pdob BETWEEN '2004-01-01' AND '2006-12-31 23:59:59';


-- SELECT pfirstname, plastname, pdob, pstate
-- FROM people
-- WHERE pdob BETWEEN '2000-01-01' AND '2010-12-31 23:59:59' AND pstate = 'CA';

-- Exercise #6
-- SELECT pfirstname, plastname, pstate 
-- FROM people 
-- WHERE pstate IN ('WY', 'KY', 'GA');

-- SELECT pfirstname, plastname, pstate 
-- FROM people 
-- WHERE pstate NOT IN ('WY', 'KY', 'GA');

-- -- Exercise #7
-- SELECT pfirstname, plastname, pcity 
-- FROM people 
-- WHERE pcity LIKE '%a%';

--Exercise #8
SELECT pfirstname, plastname, pfavorites -> 'Desserts' -> 0
FROM people
WHERE pfavorites -> 'Desserts' ->> 0 ILIKE '%a%';