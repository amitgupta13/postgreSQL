create table
    users (
        id serial primary key,
        created_at timestamp
        with
            time zone default current_timestamp,
            updated_at timestamp
        with
            time zone default current_timestamp,
            username varchar(30) not null,
            bio varchar(400),
            avatar varchar(200),
            phone varchar(25),
            email varchar(40),
            password varchar(50),
            status varchar(15),
            check (coalesce(phone, email) IS NOT NULL)
    );

create table
    posts (
        id serial primary key,
        created_at timestamp
        with
            time zone default current_timestamp,
            updated_at timestamp
        with
            time zone default current_timestamp,
            url varchar(200) not null,
            caption varchar(240),
            lat real check (
                lat is null
                OR (
                    lat >= -90
                    AND lat <= 90
                )
            ),
            lng real check (
                lng is null
                OR (
                    lng >= -180
                    AND lng <= 180
                )
            ),
            user_id integer not null references users (id) on delete cascade
    );

create table
    comments (
        id serial primary key,
        created_at timestamp
        with
            time zone default current_timestamp,
            updated_at timestamp
        with
            time zone default current_timestamp,
            contents varchar(240) not null,
            user_id integer not null references users (id) on delete cascade,
            post_id integer not null references posts (id) on delete cascade
    );

create table
    likes (
        id serial primary key,
        created_at timestamp
        with
            time zone default current_timestamp,
            user_id integer not null references users (id) on delete cascade,
            post_id integer references posts (id) on delete cascade,
            comment_id integer references comments (id) on delete cascade,
            -- check (
            -- 	coalesce((post_id)::boolean::integer, 0)
            -- 	+
            -- 	coalesce((comment_id)::boolean::integer, 0) !!!!POSTGRES SPECIFIC uncomment in pgadmin!!!
            -- 	= 1
            -- ),
            unique (user_id, post_id, comment_id)
    );

create table
    photo_tags (
        id serial primary key,
        created_at timestamp
        with
            time zone default current_timestamp,
            updated_at timestamp
        with
            time zone default current_timestamp,
            user_id integer not null references users (id) on delete cascade,
            post_id integer not null references posts (id) on delete cascade,
            x integer not null,
            y integer not null,
            unique (user_id, post_id)
    );

create table
    caption_tags (
        id serial primary key,
        created_at timestamp
        with
            time zone default current_timestamp,
            user_id integer not null references users (id) on delete cascade,
            post_id integer not null references posts (id) on delete cascade,
            unique (user_id, post_id)
    );

create table
    hashtags (
        id serial primary key,
        created_at timestamp
        with
            time zone default current_timestamp,
            title varchar(20) not null unique
    );

create table
    hashtags_posts (
        id serial primary key,
        hashtag_id integer not null references hashtags (id) on delete cascade,
        post_id integer not null references posts (id) on delete cascade,
        unique (hashtag_id, post_id)
    );

create table
    followers (
        id serial primary key,
        created_at timestamp
        with
            time zone default current_timestamp,
            leader_id integer not null references users (id) on delete cascade,
            follower_id integer not null references users (id) on delete cascade,
            unique (leader_id, follower_id)
    );