# README

# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false, unique: true |
| encrypted_password | string | null: false |
| last_name     | string | null: false |
| first_name    | string | null: false |
| last_name_kana | string | null: false |
| first_name_kana | string | null: false |
| birthday | date | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| user    | references | null: false, foreign_key: true |
| item_name   | string | null: false |
| description   | text | null: false |
| category_id   | integer | null: false |
| condition_id   | integer | null: false |
| shipping_cost_id   | integer | null: false |
| prefecture_id   | integer | null: false |
| days_till_ship_id   | integer | null: false |
| price   | integer | null: false |

#_id はactive_hashで_idで取るためtypeはintegerになる
              
### Association

- has_one :order
- belongs_to :user

## shipping テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| order    | references | null: false, foreign_key: true |
| postal_code   | string | null: false |
| prefecture_id   | integer | null: false |
| city_town   | string | null: false |
| street   | string | null: false |
| building   | string |  |
| phone   | string | null: false |

### Association

- belongs_to :order

## orders テーブル (誰が何を購入したのか)

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :shipping
- belongs_to :item