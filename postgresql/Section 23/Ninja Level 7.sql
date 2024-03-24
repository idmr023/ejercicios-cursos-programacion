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
-------------
SELECT * FROM people;
--Exercise #1--
SELECT pfirstname || ' ' || plastname || ' ' || CAST(ppoints AS TEXT) AS "Customer Points" FROM people ORDER BY ppoints DESC;
--Exercise #2-- 
--SELECT pfirstname || ' ' || plastname || ' is ' || EXTRACT(YEAR FROM AGE((TIMESTAMP '2021-04-10 0:0:0') , pdob )) || ' years' AS "Age" FROM people ORDER BY pdob DESC;--
SELECT pfirstname || ' ' || plastname || ' is ' || EXTRACT(YEAR FROM AGE(pdob)) || ' years' AS "Age" FROM people ORDER BY pdob DESC;
--Exercise #3--
SELECT CAST(pid AS INT) AS "One", CAST(pid AS NUMERIC) AS "Two" , CAST(pid AS TEXT) AS "Three" FROM people;
--Exercise #4--
SELECT 2^8 AS "A";
SELECT 1000/150 AS "B";
SELECT 1000%150 AS "C";
SELECT 400/34.3;
SELECT ROUND(400/34.3, 4) AS "F";
SELECT 85>64 AS "G";