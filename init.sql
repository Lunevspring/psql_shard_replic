CREATE EXTENSION postgres_fdw;

CREATE SERVER shard_centr_server FOREIGN DATA WRAPPER postgres_fdw OPTIONS (host 'shard_centr_from_slave_1', dbname 'postgres', port '5432'); --создание сервера для шарда 1
CREATE SERVER shard_west_server FOREIGN DATA WRAPPER postgres_fdw OPTIONS (host 'shard_west_from_slave_2', dbname 'postgres', port '5432'); --создание сервера для шарда 2
CREATE SERVER shard_north_server FOREIGN DATA WRAPPER postgres_fdw OPTIONS (host 'shard_north_from_slave_3', dbname 'postgres', port '5432'); --создание сервера для шарда 3

CREATE USER MAPPING FOR postgres SERVER shard_centr_server OPTIONS (user 'centr', password 'centr'); --пользователь для подключения к шардовому серверу 1
CREATE USER MAPPING FOR postgres SERVER shard_west_server OPTIONS (user 'west', password 'west'); --пользователь для подключения к шардовому серверу 3
CREATE USER MAPPING FOR postgres SERVER shard_north_server OPTIONS (user 'north', password 'north'); --пользователь для подключения к шардовому серверу 3

CREATE FOREIGN TABLE phone_book_centr (
    id SERIAL,
    name TEXT,
    number INTEGER,
    district TEXT 
) SERVER shard_centr_server OPTIONS (table_name 'table_centr');

CREATE FOREIGN TABLE phone_book_west (
    id SERIAL,
    name TEXT,
    number INTEGER,
    district TEXT 
) SERVER shard_west_server OPTIONS (table_name 'table_west');

CREATE FOREIGN TABLE phone_book_north (
    id SERIAL,
    name TEXT,
    number INTEGER,
    district TEXT 
) SERVER shard_north_server OPTIONS (table_name 'table_north');

CREATE VIEW phone_book AS
SELECT * FROM phone_book_centr
UNION ALL
SELECT * FROM phone_book_west
UNION ALL
SELECT * FROM phone_book_north;
