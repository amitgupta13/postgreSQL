/*
A view is like a CTE which either represents a computed values from a table or the exact table itself
only diff from CTE is view is defined AOT and can be referenced anywhere
 */
create view
    tags as (
        select
            id,
            created_at,
            user_id,
            post_id,
            'photo_tag' as type
        from
            photo_tags
        union all
        select
            id,
            created_at,
            user_id,
            post_id,
            'caption_tags' as type
        from
            caption_tags
    );

/*
get the most popular users via tags
 */
select
    username,
    count(*)
from
    users
    join (
        select
            user_id
        from
            photo_tags
        union all
        select
            user_id
        from
            caption_tags
    ) as tags on tags.user_id = users.id
group by
    username
order by
    count(*) DESC;

/*
Same query as above but with views
 */
select
    username,
    count(*)
from
    users
    join tags on tags.user_id = users.id
group by
    username
order by
    count(*) DESC;

/*
View for 10 most recent posts
 */
create view
    recent_posts as (
        select
            *
        from
            posts
        order by
            created_at desc
        limit
            10
    );

/*
Using the view defined above get the users name assiciated to each post
 */
select
    username
from
    recent_posts
    join users on users.id = recent_posts.user_id;

/*
Changing views
 */
create
or replace view recent_posts as (
    select
        *
    from
        posts
    order by
        created_at desc
    limit
        15
);

/*
Deleting views
 */
drop view recent_posts;

/*
Get no of likes for both posts and comments for each week
 */
select
    date_trunc ( -- parses the date to its nearest week
        'week',
        coalesce(comments.created_at, posts.created_at)
    ) as week,
    count(posts.id) as num_likes_for_posts,
    count(comments.id) as num_likes_for_comments
from
    likes
    left join posts on posts.id = likes.post_id
    left join comments on comments.id = likes.comment_id
group by
    week
order by
    week;

/*
Above slow query stored in a materialized view
A materialized view runs the query 1 time when it is created and holds on to the data
this makes calling the view faster rather than executing the query
Note - This can also be referred to as cached data in a view which will not update automatically on any update on the underlying data. 
The data needs to be refreshed manually for the view.

This can be done via below query.
 */
create materialized view weekly_likes as (
    select
        date_trunc (
            'week',
            coalesce(comments.created_at, posts.created_at)
        ) as week,
        count(posts.id) as num_likes_for_posts,
        count(comments.id) as num_likes_for_comments
    from
        likes
        left join posts on posts.id = likes.post_id
        left join comments on comments.id = likes.comment_id
    group by
        week
    order by
        week
)
with
    data;

/*
Refresh materialized view
 */
refresh materialized view weekly_likes;