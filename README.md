# テーブル設計

## users テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| email         | string  | null: false |
| password      | string  | null: false |
| nickname      | string  | null: false |
| fullname      | string  | null: false |
| fullname_kana | string  | null: false |
| birthday      | date    | null: false |

### Association

- has_many :items
- has_many :comments
- has_many :purchaser

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item_name       | string     | null: false                    |
| description     | text       | null: false                    |
| category        | string     | null: false                    |
| condition       | string     | null: false                    |
| delivery_charge | boolean    | null: false                    |
| region          | string     | null: false                    |
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
| phonenumber   | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one    :building

## buildings テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| building  | string     | null: false                    |
| purchaser | references | null: false, foreign_key: true |

### Association

- belongs_to :purchaser
