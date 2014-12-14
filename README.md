SFA X SNS
=========

社内外の人脈をつなぐコミュニケーションウェブ

![SFA × SNS](http://i.imgur.com/7RagI5g.png, SFA × SNS)

## Description

SFA X SNSは社内外の人脈をつなぐコミュニケーションツールです。Salesforceで管理された社内メンバが、Facebookなどの様々な社外での活動を通して得られた人脈をSFA X SNS上でつなぐことで、新たなビジネス価値が期待できます。

- 競合他社や顧客の新たなニーズの発見

- 新たな潜在顧客の獲得

- 社外活動のビジネス評価の可視化

## Setup

- リポジトリの入手
> git clone https://github.com/lion-san/sf_hack.git

- FacebookDevloperでKEYとSECRETを取得し、以下の通り環境変数に設定
> EXPORT FACEBOOK_KEY=xxxxxxxx
>
> EXPORT FACEBOOK_SECRET=xxxxxx
>
> heroku config:set FACEBOOK_KEY=xxxxxx
>
> heorku config:set FACEBOOK_SECRET=xxxxxx

- ローカル環境へのセットアップ
> cd sf_hack
>
> bundle install --without production
>
> bundle exec rake db:reset

- ローカル環境での実行
> rails server

- Heroku環境での実行
> heroku login   <= your account
>
> heroku create  <= for New app
>
> git push heroku master
>
> heroku pg:reset DATABASE
>
> heroku run rake db:migrate

- テストデータの登録(テストデータが必要な場合は、事前に以下を実行してください)
> bundle exec rake db:populate
>
> bundle exec rake test:prepare
>
> bundle exec rspec spec/
>
> heroku run rake db:populate

- Heroku上でのアプリの実行
> heroku open

## Usage

###Registration

ホーム画面から**sign up now!**をクリックして、ユーザ情報を登録してください。

**Facebookを利用してサインインする**と、Facebookのユーザ情報が関連付けられます。

###Start

右上の**sign in**をクリックしてサインインしてください。

Facebookでサインインをした場合は、**sign in with facebook**からサインインします。

###Follow the other users

usersビューから気になるユーザを選択し、**Follow**をクリックします。

###Join in user's group

groupビューから気になるグループに対して、**Join**をクリックします。

###Remark

Homeビューでコメントを入力し、**Post**をクリックします。

## Licence

No License 

## Author

[lion-san](https://github.com/lion-san)
