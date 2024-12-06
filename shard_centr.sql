-- Создание таблицы на шардовом сервере для north
CREATE TABLE table_centr (
    id SERIAL PRIMARY KEY,
    name TEXT,
    number INTEGER,
    district TEXT 
);
INSERT INTO table_centr (id, name, number, district) VALUES 
(1, 'fRAKENBOK', 123456, 'centr'),
(2, 'siciliya', 56739, 'centr');