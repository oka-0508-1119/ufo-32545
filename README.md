# アプリケーション名
ufo-32545

# アプリケーション概要
クレーンゲームコミュニティサイト  
ユーザー登録者は獲得した景品画像を掲載させたり、  
また掲載された景品画像に他ユーザーがコメントを載せることが可能です。



# URL
https://ufo-32545.herokuapp.com/


# 要件定義
*トップページ  
ユーザー新規登録機能  
ログイン、ログアウト機能  
デバイス機能を導入しました  
Eメール、パスワードを登録することでユーザー登録が可能。


*獲得景品情報投稿機能  
ユーザーが、獲得した景品を投稿する為、導入しました  
必要な情報を入力をしたら投稿が完了します  

*コメント記入欄  
獲得投稿情報に別ユーザーがコメントを記入できます  
簡易的なコメント投稿欄を導入しました  
投稿した物についての簡易的な感想ができる様にコメント機能を追加しました




#ufo テーブル設計

# テーブル設計

## users テーブル

| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| email     | string | null: false |
| password  | string | null: false |
| name      | string | null: false |


### Association
- has_many :comments
- has_many :items


## comments テーブル

| Column      | Type       | Options      |
| ----------- | ---------- | -------------|
| text        | text       | null: false  |
| user        | references |              |
| item        | references |              |

### Association

- belongs_to :user
- belongs_to :items

## items テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ------------|
| title         | string     | null: false |
| get_price     | integer    | null: false |
| detail        | text       | null: false |
| user          | references |             |

### Association

- belongs_to :user
- has_many :comments