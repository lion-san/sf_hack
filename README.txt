==リポジトリの最新化==
Git pull
bundle install --without production
bundle exec rake db:reset
bundle exec rake db:populate
bundle exec rake test:prepare

==テストの実行==
bundle exec rspec spec/

==ローカル環境での実行==
rails server

==gitの最新化==
git add .    or git add -all ./
git commit -m "メッセージ"

==Heroku環境での実行==
git push heroku
heroku pg:reset DATABASE
heroku run rake db:migrate
heroku run rake db:populate
heroku open

==編集作業の開始==
git checkout -b sagyou_mei

==編集作業の終了==
git add .
git commit -m "メッセージ"
git checkout master
git merge sagyou_mei
git push
