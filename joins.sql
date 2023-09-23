/*
basic join from photos table to users (INNER JOIN)
 */
select
    url,
    username
FROM
    photos
    JOIN users on users.id = photos.user_id;

/*
basic join from photos table to users (LEFT JOIN)
 */
select
    url,
    username
FROM
    photos
    LEFT JOIN users on users.id = photos.user_id;

/*
basic join from photos table to users (RIGHT JOIN)
 */
select
    url,
    username
FROM
    photos
    RIGHT JOIN users on users.id = photos.user_id;

/*
basic join from photos table to users (FULL JOIN)
 */
select
    url,
    username
FROM
    photos
    FULL JOIN users on users.id = photos.user_id;

/*
JOINS with where clause
 */
select
    photos.user_id,
    comments.user_id
FROM
    comments
    JOIN photos on photos.id = comments.photo_id
WHERE
    comments.user_id = photos.user_id;

/*
Triple join
 */
select
    url,
    contents,
    username
FROM
    comments
    JOIN photos on photos.id = comments.photo_id
    JOIN users on users.id = comments.user_id
    AND users.id = photos.user_id
WHERE
    comments.user_id = photos.user_id;