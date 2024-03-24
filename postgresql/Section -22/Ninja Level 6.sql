SELECT * FROM people;
--Exercise #1-- 
SELECT DISTINCT pcity FROM people ORDER BY pcity ASC;
--Exercise #2--
SELECT DISTINCT pcity AS "TOWNS" FROM people ORDER BY pcity ASC;
--Exercise #3--
SELECT DISTINCT pfirstname || ' ' || plastname AS "Full name" FROM people ORDER BY plastname ASC;
--Exercise #4--
SELECT pstate || ' has the city ' || pcity AS "TOWNS" FROM people ORDER BY pstate DESC, pcity ASC;
--Exercise #5--
SELECT lidesired, lipurchased, lidesired - lipurchased AS "Items still desired" FROM listitems ORDER BY "Items still desired" ASC;
--Exercise #6--
SELECT ROUND((1 - (CAST(lidesired - lipurchased AS NUMERIC)/CAST(lidesired AS NUMERIC)))*100, 2) || '%' AS "Fulfillment" FROM listitems;