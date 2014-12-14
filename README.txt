+導入手順+
==リポジトリの入手==
git clone https://github.com/lion-san/sf_hack.git

==ローカル環境へのセットアップ==
cd sf_hack
bundle install --without production
bundle exec rake db:reset

==テストデータが必要な場合、以下コマンドを実行してください
bundle exec rake db:populate
bundle exec rake test:prepare

==テストの実行※要テストデータ
bundle exec rspec spec/

==ローカル環境での実行==
rails server

==Heroku環境での実行==
heroku login   <= your account
heroku create  <= for New app
git push heroku master
heroku pg:reset DATABASE
heroku run rake db:migrate

==テストの実行※要テストデータ
heroku run rake db:populate

==ブラウザで開く
heroku open

※Facebook OAUTH認証を利用する場合、FacebookDeveloperよりご登録ください。
==環境変数==
EXPORT FACEBOOK_KEY=xxxxxxxx
EXPORT FACEBOOK_SECRET=xxxxxx
heroku config:set FACEBOOK_KEY=xxxxxx
heorku config:set FACEBOOK_SECRET=xxxxxx
==EOF==
