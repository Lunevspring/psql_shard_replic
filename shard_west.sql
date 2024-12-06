-- Создание таблицы на шардовом сервере для west
CREATE TABLE table_west (
    id SERIAL PRIMARY KEY,
    name TEXT,
    number INTEGER,
    district TEXT 
);
INSERT INTO table_west (id, name, number, district) VALUES 
(5, 'scholl№35', 78345783, 'west'),
(6, 'malikon', 939845, 'west');