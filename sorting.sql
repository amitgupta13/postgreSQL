/*
sort by default order by sorts in ASC order for DESC add DESC keyword
 */
select
    *
from
    products
order by
    price DESC;

/*
sort by multiple ordering rules
 */
select
    *
from
    products
order by
    price,
    weight DESC;

/*
skip first 40 records
 */
select
    *
FROM
    users
OFFSET
    40;

/*
get 5 most expensive products skipping the most expensive
 */
select
    *
FROM
    products
order BY
    price DESC
LIMIT
    5
OFFSET
    1;

/*
Write a query that shows the names of only the second and third most expensive phones.
 */
select
    name
from
    phones
order by
    price desc
limit
    2
offset
    1;