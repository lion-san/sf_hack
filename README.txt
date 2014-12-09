1.Git pullで最新化する
2.bundle install --without production
3.bundle exec rake db:reset
#4.bundle exec rake db:migrate 不要でした
5.bundle exec rake db:populate
6.bundle exec rake test:prepare

==テストの実行==
7.bundle exec rspec spec/

==ローカル環境での実行==
8.rails server


==gitの最新化==


==Heroku環境での実行==
9.git push heroku
10.herilu pg:reset DATABASE
11.heroku run rake db:migrate
12.heroku run rake db:populate

==編集作業の開始==
13.git checkout -b sagyou_mei

==編集作業の終了==
14.git add .
15.git commit -m "メッセージ"
16.git checkout master
17.git merge sagyou_mei
18.git push
