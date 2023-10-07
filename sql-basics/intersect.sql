/*
INTERSECT keyword finds the duplicates in 2 queries
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
INTERSECT ALL
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