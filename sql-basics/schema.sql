/*
Schemas are like folders in database which has its own copy of tables
 */
create schema test;

/*
Create user table in test schema
 */
create table
    test.users (id serial primary key, username varchar);

/*
Sets the schema search path priority from highest(leftmost) to lowest(rightmost) 
default setting - set search_path to "$user", public;
 */
set
    search_path to test,
    public;