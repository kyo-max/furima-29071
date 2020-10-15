# テーブル設計

## users テーブル

| Column          | Type    | Options                                           |
| --------------- | ------- | ------------------------------------------------- |
| nickname        | string  | null: false                                       |
| email           | string  | null: false,uniqueness:{case_sensitive: false},   |
|                 |         | format: {with: /\A[\w+-.]+@[a-z\d-.]+.[a-z]+\z/i} |
| password        | string  | null: false, length: {minimum: 7}                 |
| last_name       | string  | null: false                                       |
| first_name      | string  | null: false                                       |
| last_name_kana  | string  | null: false                                       |
| first_name_kana | string  | null: false                                       |
| birthday        | integer | null: false                                       |

### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column              | Type    |     Options |
| ------------------- | ------- | ----------- |
| image               | string  | null: false |
| item_name           | string  | null: false |
| description         | text    | null: false |
| category            | integer | null: false |
| item_status         | integer | null: false |
| shipping_fee_bearer | integer | null: false |
| shipping_area       | integer | null: false |
| ship_day            | integer | null: false |
| price               | integer | null: false |

### Association

- belongs_to :users
- has_one    :buyers

## buyers テーブル

| Column         | Type | Options |
| -------------- |
| user_id        | integer | null: false |
| item_id        | integer | null: false |
| card_id        | string  | null: false |
| postal_code    | string  | null: false |
| prefectures    | string  | null: false |
| municipality   | string  | null: false |
| block_number   | string  | null: false |
| apartment_name | string  |             |
| phone_number   | integer | null: false |

### Association

- belongs_to :users
- belongs_to :items