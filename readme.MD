1. run below command for migration -

set DATABASE_URL=postgres://postgres:postgres@localhost:5432/socialnetwork&&npm run migrate up

2. to rollback run -

set DATABASE_URL=postgres://postgres:postgres@localhost:5432/socialnetwork&&npm run migrate down

insert into users (bio, username)
values
('Test1', 'Gia'),
('Test2', 'Tia');
