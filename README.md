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
| shipping_area_id   | integer | null: false |
| days_til_ship_id   | integer | null: false |
| price   | integer | null: false |

### Association

- has_one :order
- belongs_to :user

## shipping テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| order    | references | null: false, foreign_key: true |
| postal_code   | string | null: false |
| prefecture   | string | null: false |
| city_town   | string | null: false |
| street   | string | null: false |
| building   | string | null: false |
| phone   | string | null: false |

### Association

- belongs_to :order

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :shipping
- belongs_to :item