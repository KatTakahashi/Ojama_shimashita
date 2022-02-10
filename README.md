# おじゃましました

## サイト概要

日本各地の魅力を共有する写真投稿型SNSです。<br>
投稿詳細ページにてその写真が撮影されたスポットをGoogle Mapsにてご確認頂けます。<br>
機能面だけに注力するのではなく、気持ち良くご覧頂けるようデザインもこだわっております。<br>
レスポンシブ対応しておりますので、スマートフォンからもご利用頂けます。

### ＜目的＞
投稿内容を都道府県別に記録して共有すること、<br>
Google Mapsの活用により投稿写真のロケーションが一目でわかること、<br>
投稿者が訪れた都道府県を見える化することを目的としています。

### ＜機能＞
- 会員登録、ログイン機能(devise)
- 投稿機能
  - 画像投稿機能(Active Storage)
  - 都道府県選択機能(enum)
  - 位置情報取得機能(geocoder)
- いいね機能(Ajax)
- コメント機能(Ajax)
- フォロー機能
- お問い合わせ機能(Action MAiler)
- 訪問済み/未訪問 都道府県の色分け機能(Japan Map)<br>
- 環境変数(dotenv)
- デバッグ(pry-byebug)
- バリデーションメッセージの日本語化(rails-i18n)
- レイアウト/レスポンシブ対応(主にCSS Grid Layout)

#### [API 関連]
- Maps JavaScript API
  - 投稿内容の位置情報をGoogle Mapsに表示するために利用
- Geocoding API
  - 投稿内容の位置情報取得精度向上のために利用
- Cloud Vision API
  - 投稿写真へのタグ付け機能のために利用(AI機能)
- Cloud Translation API
  - Cloud Vision APIにより生成されたタグ(英語)の日本語化のために利用

## テーマを選んだ理由

私は**旅人の困りごと**を解決したいと考え、**"写真×ロケーション"**をメインとするSNSサイトを制作しました。<br>
旅人の困りごととして、<br>
- 情報収集源である主要SNSの投稿にどこで撮影したかの位置情報が無いことが多い
- 位置情報があったとしても土地勘の無い場所ではその場所を検索する手間が発生
- 自身の過去の投稿を時系列でしか遡れない　※検索機能を除く
- 自身が訪れていない都道府県を手軽に知りたい<br>
などが挙げられます。<br>

当サイトでは下記の機能により**旅人の困りごとを解消**できます。<br>
- 投稿時に"都道府県", "市町村名", "スポット名"を入力するフォームを設け、<br>
  その場所を投稿詳細ページにGoogle Maps で表示することでロケーションの把握に貢献
- 都道府県別の一覧ページを設け、興味ある都道府県の投稿を探しやすくすることに貢献
- 会員別にも都道府県別の一覧ページを設けることで、会員の「あの場所どこだっけ?」を<br>
  過去の投稿を時系列で遡るより解決しやすくすることに貢献
- 投稿時の都道府県から会員詳細ページに設けた日本地図に訪れた都道府県として可視化

## ターゲットユーザ

- 旅の写真を共有したい人
- 旅の写真や訪れた都道府県を記録したい人
- 旅の目的地を探している人
- 日本の素晴らしい景色を写真で体験したい人

## 主な利用シーン

- 自慢の旅の写真を共有したい時
- とっておきの写真を後で見返すために記録したい時
- 訪れた都道府県を地図上で可視化したい時
- 旅の目的地を検討する時
- 知らなかった日本の風景を写真で見たい人

## 設計書

- ER 図
  https://drive.google.com/file/d/1f8rDCpcNX5yB_fTpJLpLy-pi9UeVeVS9/view?usp=sharing

- テーブル定義書
  https://docs.google.com/spreadsheets/d/1GHDrrrNDTbnDPb5r9J5Q64BH85m4yRP2p5KE62_ha3o/edit?usp=sharing

- アプリケーション詳細設計
  https://docs.google.com/spreadsheets/d/1GKj1Exwbbu9O79ZJDDnX1TkQnsfOCkVR6Lvgje0Nx2Y/edit?usp=sharing

## チャレンジ要素一覧

https://docs.google.com/spreadsheets/d/1rL7TU7FfH4DY7jqnJUelITTu5emBVGkwSn4JwT_KDIg/edit?usp=sharing

## 開発環境

- OS：Linux(CentOS)
- 言語：HTML, CSS, JavaScript, Ruby 2.6.3
- フレームワーク：Ruby on Rails 5.2.6
- データベース：MySQL 5.7(本番環境), SQLite 3.7.17(開発環境)
- Webサーバ：Nginx 1.20.0
- インフラ：AWS(EC2, RDS)
- JS ライブラリ：jQuery
- IDE：Cloud9