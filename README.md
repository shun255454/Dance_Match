# Dancers Match
ダンサーのマッチングアプリです。一緒に練習をしたりチームを組みたい方のアプリです<br>
インフラにAWSのEC2サービスを活用しています。

<!-- ![minsola-preview](https://user-images.githubusercontent.com/62027190/83033724-6fc32f80-a072-11ea-8632-94be7d022781.jpg) -->

## 制作背景
ダンス仲間を増やたい時や自分のやっているダンスだけではなく色んなジャンルのダンサーと繋がりたいと思った時に便利なサイトがなかったので作成しようと思いました。

## URL
http://54.168.10.0/ <br>
- ゲストユーザー１、メールアドレス"`test@gmail.com`"、パスワード"`12345678`"でログインできます。<br>
- ゲストユーザー2、メールアドレス"`test1@gmail.com`"、パスワード"`111111`"でログインできます。<br>
- チャットでは2つのブラウザを立ち上げて（１つはgoogle chromeのシークレットモードを立ち上げてください）、2つのユーザーでいいねした後にチャット画面へ遷移して確かめてみてください。<br>
- レスポンシブ対応しているので、スマホからでもご覧いただけます。

## 使用技術
- Ruby 2.5.1 Rails 5.2.4.3
- MySQL 5.6.47
- Puma,Unicorn
- AWS（EC2）
- RSpec
- Sass, Bootstrap, jQuery


## 機能一覧
- ユーザー機能
  - deviseを使用
  - 新規登録、ログイン、ログアウト機能
  - プロフィール画像のアップロードはcarrierwaveを使用
  - プロフィール、登録情報編集機能
- スワイプ機能
  - スワイプ時LIkeとDislikeでマッチング、スワイプ画面にユーザーの一覧を表示、コメントとユーザー名表示
- マッチング機能
  - ユーザー同士がLIkeしたらマッチングします。
  - マッチングユーザー一覧表示
- チャット機能
  - マッチングしたユーザー同士でチャットができます。
- Rspecによる自動テスト機能
  - 単体テスト機能

## 課題や今後実装したい機能
- 開発環境では非同期通信でチャットできるが本番環境では更新しないと送信されたコメントが反映されない
- ジャンルカテゴリーごとにユーザーの一覧画面を分ける