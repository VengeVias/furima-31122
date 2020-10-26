# テーブル設計

## users テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| email          | string  | null: false |
| password       | string  | null: false |
| nickname       | string  | null: false |
| firstname      | string  | null: false |
| lastname       | string  | null: false |
| firstname_kana | string  | null: false |
| lastname_kana  | string  | null: false |
| birthday       | date    | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :purchasers

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| description     | text       | null: false                    |
| category        | integer    | null: false                    |
| condition       | integer    | null: false                    |
| delivery_charge | integer    | null: false                    |
| region          | integer    | null: false                    |
| days_to_ship    | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- has_many   :comments
- belongs_to :user
- has_one    :purchaser

## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user

## purchasers テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | integer    | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| address       | integer    | null: false                    |
| building      | string     | null: false                    |
| phonenumber   | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one    :building

## logs テーブル

| Column           | Type       | Options                                           |
| ---------------- | ---------- | ------------------------------------------------- |
| item             | references | null: false, foreign_key: true                    |
| user             | references | null: false, foreign_key: true                    |

### Association

- belongs_to :item
- belongs_to :user

