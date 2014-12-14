SFA X SNS
=========

A communication Web Application that connects the internal and external network of contacts.

社内外の人脈をつなぐコミュニケーションウェブ

![SFA × SNS](http://i.imgur.com/7RagI5g.png, SFA × SNS)

## Description

The SFA x SNS is a communication Web Application that connects the internal and external network of contacts. Employees who are managed by Salesforce will connect the own personal connections obtained through the activities of a variety of external, such as Facebook.New business value, such as the following is expected.

SFA X SNSは社内外の人脈をつなぐコミュニケーションツールです。Salesforceで管理された社内メンバが、Facebookなどの様々な社外での活動を通して得られた人脈をSFA X SNS上でつなぐことで、新たなビジネス価値が期待できます。

- Discovery of new needs of competitors and customers

- 競合他社や顧客の新たなニーズの発見

- Acquisition of new potential customers

- 新たな潜在顧客の獲得

- Visualization of business evaluation of outside activities

- 社外活動のビジネス評価の可視化

## Setup

- リポジトリの入手
> git clone https://github.com/lion-san/sf_hack.git

- Facebook設定
FacebookDevloperでKEYとSECRETを取得し、以下の通り環境変数に設定してください。
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

- テストデータの登録（テストデータが必要な場合のみ）
テストデータが必要な場合は、事前に以下を実行してください。
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

Click the **sign up now!** on the Home tab, please register the user information.

ホーム画面から**sign up now!**をクリックして、ユーザ情報を登録してください。

If you **sign up with facebook**, associated with the user information of Facebook.

**Facebookを利用してサインインする**と、Facebookのユーザ情報が関連付けられます。

###Start

Please sign in by clicking on the **sign in** in the upper right.

右上の**sign in**をクリックしてサインインしてください。

If you **sign in with Facebook**, you sign in from **sign in with facebook**.

Facebookでサインインをした場合は、**sign in with facebook**からサインインします。

###Follow the other users

Select the user to be worried about in the users view, and then click the **Follow**.

usersビューから気になるユーザを選択し、**Follow**をクリックします。

###Join in user's group

Click on the **Join** for a group to be intrested in the group view.

groupビューから気になるグループに対して、**Join**をクリックします。

###Remark

**Post** your commnet in the home view.

Homeビューでコメントを入力し、**Post**をクリックします。

## Licence

No License 

## Author

[lion-san](https://github.com/lion-san)




