/*
select distinct departments from product table
 */
select DISTINCT
    department
FROM
    products;

/*
select count of distinct departments from product table
 */
select
    count(DISTINCT department)
FROM
    products;