/*
Show the username and date the user was tagged in captions or photos before Jan 07th 2010
 */
select
    username,
    t.created_at
from
    users
    join (
        select
            user_id,
            created_at
        from
            caption_tags
        union all
        select
            user_id,
            created_at
        from
            photo_tags
    ) as t on users.id = t.user_id
where
    t.created_at < '2010-01-07';

/*
Same query as above but via CTE (Common Table Expression)
 */
with
    tags as (
        select
            user_id,
            created_at
        from
            caption_tags
        union all
        select
            user_id,
            created_at
        from
            photo_tags
    )
select
    username,
    tags.created_at
from
    users
    join tags on users.id = tags.user_id
where
    tags.created_at < '2010-01-07';

/*
Recursive CTE to get countdown from a particular number
 */
with recursive
    countdown (val) as (
        select
            10 as val -- initial or non recursive query
        union
        select
            val - 1
        from
            countdown
        where
            val > 1 -- recursive query
    )
select
    *
from
    countdown;

/*
Get instagram suggestions via CTE
 */
with recursive
    suggestions (leader_id, follower_id, depth) as (
        select
            leader_id,
            follower_id,
            1 as depth
        from
            followers
        where
            follower_id = 1000
        union
        select
            followers.leader_id,
            followers.follower_id,
            depth + 1
        from
            followers
            join suggestions on suggestions.leader_id = followers.follower_id
        where
            depth < 3
    )
select distinct
    users.id,
    users.username
from
    suggestions
    join users on users.id = suggestions.leader_id
where
    depth > 1
limit
    30;