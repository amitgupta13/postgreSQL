/*
Create index on username for users table
 */
create index users_username_idx on users (username);

/*
delete index on username for users table
 */
drop index users_username_idx;

/*
Explain analyze to give some benchmark results for query
 */
explain analyze
select
    *
from
    users
where
    username = 'Emil30';

/*
Below query gets the amount of space used my users table
 */
select
    pg_size_pretty (pg_relation_size ('users'));