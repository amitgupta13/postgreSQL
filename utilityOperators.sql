/*
Greatest operator
 */
select
    name,
    weight,
    greatest (30, 2 * weight)
FROM
    products;

/*
Least operator
 */
select
    name,
    price,
    least (price * 0.5, 300)
FROM
    products;

/*
CASE operator
 */
select
    name,
    price,
    CASE
        when price > 600 THEN 'high'
        when price > 300 THEN 'medium'
        ELSE 'cheap'
    end
FROM
    products;