/*
Create table
 */
CREATE TABLE
  cities (
    name VARCHAR(50),
    country VARCHAR(50),
    population INTEGER,
    area INTEGER
  );

/*
Create table with foreign key
 */
CREATE table
  photos (
    id SERIAL PRIMARY KEY,
    url VARCHAR(200),
    user_id INTEGER REFERENCES users (id)
  );

/*
Insert single row into table
 */
INSERT INTO
  cities (name, country, population, area)
VALUES
  ('Tokyo', 'Japan', 386456743, 8223);

/*
Insert multiple row into table
 */
INSERT INTO
  cities (name, country, population, area)
VALUES
  ('Shanghai', 'China', 386456743, 8223),
  ('Delhi', 'India', 386456743, 8223),
  ('Dubai', 'Brazil', 386456743, 8223);

/*
Fetch everything from table
 */
SELECT
  *
FROM
  cities;

/*
Fetch everything from table, also select specific columns from table
 */
SELECT
  name,
  country
FROM
  cities;

/*
Fetch everything from table, also select specific columns from table as well as get calculated columns with aliasing
 */
SELECT
  name,
  country,
  population / area as density
FROM
  cities;