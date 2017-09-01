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

APP_NAME="Laravel"
APP_ENV=local
APP_DEBUG=true
APP_LOG_LEVEL=debug
APP_URL=http://laravel-blog.dev
```
> import `databases\somedata.sql` into your database 
> and the manager URL is `/admin`

```
composer install
```
```
php artisan voyager:install
php artisan serve
```

UserName: `admin@admin.com`
Password: `password`

## Configure Algolia for search

Login the [algolia.com](https://www.algolia.com/),and find under info.

```
# algolia key
ALGOLIA_APP_ID=
ALGOLIA_SECRET=
ALGOLIA_SEARCH=
```

* Import the given model into the search index
```
php artisan scout:import "App\Post"
```

* Flush all of the model's records from the index
```
php artisan scout:flush "App\Post"
```

## Optional

```
npm install
npm run prod
```
