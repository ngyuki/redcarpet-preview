
## Install

```console
$ git clone https://github.com/ngyuki/redcarpet-preview.git
$ cd redcarpet-preview
$ bundle install --deployment
```

Server start for development mode.

```console
$ bundle exec rackup
```

Server start for production mode.

```console
$ RACK_ENV=production bundle exec foreman start
```

## Demo

- [Redcarpet Preview with Coderay  - Heroku](http://redcarpet-preview.herokuapp.com/)
- [Redcarpet Preview with Pygments - Heroku](http://redcarpet-preview.herokuapp.com/pygments.html)
- [Redcarpet Preview with Rouge    - Heroku](http://redcarpet-preview.herokuapp.com/rouge.html)

## Deploy to heroku

```
heroku create --stack cedar redcarpet-preview
heroku config:set RACK_ENV=production
git push heroku master
```
