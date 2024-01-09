SELECT CAST('{"name": "Bob", "favoriteFoods": ["Banana", "Candy", "Ceviche"]}' AS JSONB) @> CAST('{"favoriteFoods": ["Banana"]}' AS JSONB);
