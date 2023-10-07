/*
Using subquery to get max price in toys department
 */
select
    name,
    price
FROM
    products
WHERE
    price > (
        select
            max(price)
        FROM
            products
        WHERE
            department = 'Toys'
    );

/*
Scalar subquery in select meaning it returns only 1 value
 */
select
    name,
    price,
    (
        select
            max(price)
        FROM
            products
    )
FROM
    products
WHERE
    price > 867;

/*
Sub query in from
Note - aliasing of subquery is important as it will give an error
 */
select
    name,
    price_weight_ratio
FROM
    (
        select
            name,
            price / weight as price_weight_ratio
        FROM
            products
    ) as p
WHERE
    price_weight_ratio > 5;

/*
Sub query to get average orders per user
 */
select
    avg(order_count)
FROM
    (
        select
            user_id,
            count(*) as order_count
        FROM
            orders
        group BY
            user_id
    ) as p;

/*
Calculate the average price of phones for each manufacturer.  Then print the highest average price. Rename this value to max_average_price
 */
select
    max(average_price) as max_average_price
from
    (
        select
            avg(price) as average_price
        from
            phones
        group by
            manufacturer
    ) as p;

/*
Subquery in join
 */
select
    first_name
FROM
    users
    JOIN (
        select
            user_id
        FROM
            orders
        WHERE
            product_id = 3
    ) as o on users.id = o.user_id;

/*
Subquery to get all orders ids where price of product is > 50
Subquery in where clause
 */
select
    id
FROM
    orders
WHERE
    product_id in (
        select
            id
        FROM
            products
        WHERE
            price / weight > 50
    );

/*
Subquery to get average price to compare price with a scalar/single value
Get all products where price is > average price of all products
 */
select
    name
FROM
    products
WHERE
    price > (
        select
            avg(price)
        FROM
            products
    );

/*
Show the name of all products that are not in the same department as products with a price less than 500
 */
select
    name,
    department,
    price
from
    products
WHERE
    department not in (
        select
            department
        FROM
            products
        WHERE
            price < 500
    );

/*
Select all products where the price of products is greater than all products in 'industrial' department
 */
select
    name,
    department,
    price
FROM
    products
WHERE
    price > all (
        select
            price
        FROM
            products
        WHERE
            department = 'Industrial'
    );

/*
Select all products where the price of products is greater than some products in 'industrial' department
 */
select
    name,
    department,
    price
FROM
    products
WHERE
    price > some (
        select
            price
        FROM
            products
        WHERE
            department = 'Industrial'
    );

/*
CORRELATED SUBQUERY
show the name, department, price of the most expensive product in each department
 */
select
    name,
    department,
    price
FROM
    products as p1
WHERE
    p1.price = (
        select
            max(price)
        FROM
            products as p2
        WHERE
            p1.department = p2.department
    );

/*
CORRELATED SUBQUERY
no of orders for each product without using join or groupby
 */
select
    id,
    (
        select
            count(*)
        FROM
            orders
        WHERE
            orders.product_id = products.id
    )
FROM
    products;

/*
select without from
 */
select
    (
        select
            max(price)
        FROM
            products
    ),
    (
        select
            avg(price)
        FROM
            products
    );