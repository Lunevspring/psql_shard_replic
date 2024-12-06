-- Создание таблицы на шардовом сервере для north
CREATE TABLE table_north (
    id SERIAL PRIMARY KEY,
    name TEXT,
    number INTEGER,
    district TEXT
);
INSERT INTO table_north (id, name, number, district) VALUES 
(3, 'moscow', 216374, 'north'),
(4, 'arbuz', 23495, 'north');