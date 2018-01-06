#!/bin/bash
echo "Install ss-panel"
php composer.phar install
php artisan key:generate
chown -R www:www storage/
chmod -R 777 storage/

echo "Migrate database"
php artisan migrate

php artisan db:seed --class=ConfigTableSeeder
php artisan db:seed --class=CountryTableSeeder
php artisan db:seed --class=LevelTableSeeder
php artisan db:seed --class=SsConfigTableSeeder
php artisan db:seed --class=UserTableSeeder

echo 'Starting Web....'
exec "$@"