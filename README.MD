Setup

1. Install NodeJs

2. In Linux terminal execute next commands
```shell
git clone git@github.com:seeff00/flp.git
cd flp
composer install
npm install
npm run build
php bin/console make:migration
php bin/console doctrine:migrations:migrate
symfony server:start --port=8082
```

3. Open browser on http://localhost:8082
