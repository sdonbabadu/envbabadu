1) установить Docker
2) установить docker-compose
3) скачать репозиторий на уровне папки с проектом
4) в папке с этим репозиторием запустить "docker-compose up -d"
5) запустить команду "docker ps" для вывода всех запущенных контейнеров
6) войти в контейнер php можно командой docker exec -it "название_контейнера" bash
7) bash after_exec.sh
8) cd /var/storage/www/babadu.ru/vagrant/provision
9) после успешного запуска контейнеров, в контейнере php запустить скрипт из ../папка_проекта/vagrant/provision/load-dump.sh
10) долго ждем пока БД скачается и зальется в локальную БД
11) чтобы работало api выполняем команды
12) cd /var/storage/www/babadu.ru/api
13) composer install
14) готово!
