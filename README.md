Проект по реализации разворачивания кластера postgresql с sharding и replication

Логика проекта:
При инициализации компоуз файла в образы соответствующих шардов загружаются файлы с расширением .sql, чтобы создать таблицы, которые в дальнейшем будут использоваться для файла init.sql в мастере, который используя инструмент fdw создает соединение мастера и шардов, создаются внешние таблицы для каждого шарда и общая таблица в виде представления всех шардов. При внесении изменений в таблицы шардов и мастера. данные передаются корректно.

Для запуска будет достаточно запустить наш docker compose файл:
docker compose up -d

Для проверки работоспособности кластера поднят контейнер с adminer, с помощью которого можно наблюдать изменения наших db, соответствуюшие пользовтаели и пароли на данный момент прописаны в перменных окружения в docker compose файле.
