# README

# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |
| last_name     | string | null: false |
| first_name    | string | null: false |
| last_name_kana | string | null: false |
| first_name_kana | string | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| user    | references | null: false, foreign_key: true |
| image   | ActiveStorage | null: false |
| item_name   | text | null: false |
| category   | string | null: false |
| condition   | string | null: false |
| shipping_cost   | string | null: false |
| shipping_area   | string | null: false |
| days_til_ship   | string | null: false |
| price   | string | null: false |

### Association

- has_many :orders
- belongs_to :user

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| items    | references | null: false, foreign_key: true |
| credit_number   | string | null: false |
| postal_code   | string | null: false |
| prefecture   | string | null: false |
| city_town   | string | null: false |
| street   | string | null: false |
| building   | string | null: false |
| phone   | string | null: false |

### Association

- belongs_to :user
- belongs_to :order