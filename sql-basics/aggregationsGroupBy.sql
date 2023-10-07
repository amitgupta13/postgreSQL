/*
group by userId
 */
select
    user_id
FROM
    comments
group BY
    user_id;

/*
aggregation function in action SUM(col name)
 */
select
    sum(id)
FROM
    comments;

/*
group by with aggregate fn asiased as num_comments_created
Note - rows with id null will not be counted. In order to do that use count(*)
 */
select
    user_id,
    count(id) as num_comments_created
FROM
    comments
group BY
    user_id;

/*
Query to count no of comments for all photo
 */
select
    photo_id,
    count(*)
FROM
    COMMENTS
group BY
    photo_id;

/*
Query with joins, group by and aggregation combined
 */
select
    name,
    count(*)
from
    books
    join authors on authors.id = books.author_id
group by
    authors.name;

/*
Query to get all photos with id less than 3 having more than 2 comments
 */
select
    photo_id,
    count(*)
FROM
    COMMENTS
WHERE
    photo_id < 3
group BY
    photo_id
HAVING
    count(*) > 2;

/*
Query to get all users where user has commented on first 50 photos and has more than 20 comments
 */
select
    user_id,
    count(*)
FROM
    comments
WHERE
    photo_id < 50
group BY
    user_id
HAVING
    COUNT(*) > 20;

/*
Given a table of phones, print the names of manufacturers and total revenue (price * units_sold) for all phones.  Only print the manufacturers who have revenue greater than 2,000,000 for all the phones they sold
 */
select
    manufacturer,
    sum(price * units_sold)
from
    phones
group by
    manufacturer
having
    sum(price * units_sold) > 2000000;