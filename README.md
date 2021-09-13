# README

## アプリ概要
ものづくり企業の、資料・コミュニケーションプラットフォーム

### アプリ作成の背景
雑多な業務に追われると日々の仕事を楽しめない！そういった前職で職場内の不満を基に作成しました。<br>
日常的な雑多な業務とは？毎日大量に飛び交う資料、メールの管理です。<br>
やり取りする相手が異なると、同じような資料提供、コミュニケーションを繰り返す。<br>
オープンなプラットフォームがあればそんな問題は解決できる。そう考えて作成に至りました。

### このアプリが解決する課題
日本の企業、製造業が抱える、社員の意欲の欠乏、労働生産性の低さを業務の効率化より解決する。<br>
資料管理、コミュニケーションの向上により、雑多な業務の量を削減し、付加価値の高い仕事に注力できるようにする。


## 開発言語
- Ruby 2.6.5
- Ruby on Rails 5.2.5

## デプロイ先
AWS (EC2, S3)
URL: http://3.23.243.242/

## 機能一覧
- サインアップ・ログイン機能
  - gem 'devise'
- プロダクトとカスタマーのCRUD
- プロダクトとカスタマーの検索機能
  - 'ransack'
- ドキュメントのCRUD
  - 'carrierwave'
- コメント機能 (Ajax)
- スケジュール機能 (Ajax)
- スケジュールのページネーション
  - gem 'kaminari'
- プロジェクト登録機能
- カスタマーの地図表示
  - Maps JavaScript API

## 実行手順
```
$ git clone git@github.com:Almonta/original_app.git
$ cd original_app
$ bundle install
$ rails db:create
$ rails db:migrate
$ yarn add jquery
$ rails s
```
## カタログ設計
[カタログ設計](https://docs.google.com/spreadsheets/d/1fp5PEtnYYU6hirToJtlg3giSCGADTWTKpE_8FrO6kmY/edit?usp=sharing)

## テーブル設計
[テーブル設計](https://docs.google.com/spreadsheets/d/1t0XmDtx391A8mWkQZK8hT667f7sE4cdtrQQgI1ZB09I/edit?usp=sharing)

## ER図  
![ER図](https://i.gyazo.com/0bb0a678b16e2ad52d0ea64e19a86e7a.png)

## 画面遷移図  
![画面遷移図](https://i.gyazo.com/4e2f20dcbe74eb16e0d471891913153e.png)

## ワイヤーフレーム
[ワイヤーフレーム](https://cacoo.com/diagrams/YurmX2riFADlnI3Z/7F0CC)
