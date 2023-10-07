/*
Select with filtering with where
 */
SELECT
    name,
    area
FROM
    cities
WHERE
    area > 4000;

SELECT
    name,
    area
FROM
    cities
WHERE
    area BETWEEN 5000 AND 9000;

SELECT
    name,
    area
FROM
    cities
WHERE
    name IN ('Delhi', 'Shanghai');