/*
EXCEPT keyword finds records in the first query that does not exist in the second query
Note - if you don't want the duplicate records remove ALL
 */
(
    select
        *
    FROM
        products
    order BY
        price DESC
    LIMIT
        4
)
EXCEPT ALL
(
    select
        *
    FROM
        products
    order BY
        price / weight DESC
    LIMIT
        4
);