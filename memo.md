
## Gemfile の雛形作成
bundle init

## gem のインストール
bundle install --path=vendor/bundle

## 開発モードで起動
bundle exec foreman start

## 本番モードで起動
RACK_ENV=production bundle exec foreman start

## git リポジトリ
git init
git add .
git commit -m first

## heroku アプリの作成とプッシュ
heroku create --stack cedar redcarpet-preview
heroku config:set RACK_ENV=production
git push heroku master
