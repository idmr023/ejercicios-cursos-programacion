--Excercise #1--
SELECT pfirstname, pfavorites -> 'Desserts' FROM people LIMIT 10;
--Excercise #2--
SELECT pfirstname AS "First Name", pfavorites @> CAST('{"Desserts": ["cake"]}' AS JSONB) FROM people;
-- Exercise #3
SELECT pfirstname, (pfavorites -> 'Desserts') ? 'ice cream' FROM people;