## Install

```
git clone git@github.com:curder/laravel-blog.git
```

## Configure
```
cp .env.example .env

php artisan key:generate
```
and modify the `.env` file with your own config.
```
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=DBName
DB_USERNAME=DBuser
DB_PASSWORD=DBpassword
```

> import `databases\20170827.sql` into your database 
> and the manager URL is `/admin`

```
composer install
```

```
php artisan serve
```

## Optional

```
npm install
npm run prod
```
