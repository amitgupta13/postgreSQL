/*
UNION keyword combines the result of 2 queries into 1
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
UNION ALL
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

/*
Write a query that will print the manufacturer of phones where the phone's price is less than 170.  Also print all manufacturer that have created more than two phones.
 */
select
    manufacturer
from
    phones
where
    price < 170
union
select
    manufacturer
from
    phones
group by
    manufacturer
having
    count(*) > 2;