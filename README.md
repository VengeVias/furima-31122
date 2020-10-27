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

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| region_id          | integer    | null: false                    |
| days_to_ship_id    | integer    | null: false                    |
| price_id           | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

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
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building      | string     |                                |
| phonenumber   | string     | null: false                    |
| log           | references | null: false, foreign_key: true |

### Association
- belongs_to :log

## logs テーブル

| Column           | Type       | Options                                           |
| ---------------- | ---------- | ------------------------------------------------- |
| item             | references | null: false, foreign_key: true                    |
| user             | references | null: false, foreign_key: true                    |

### Association

- belongs_to :item
- belongs_to :user
- has_one    :purchaser

