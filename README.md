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
| birthday        | date    | null: false                                       |

### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column                 | Type    |     Options |
| ---------------------- | ------- | ----------- |
| item_name              | string  | null: false |
| description            | text    | null: false |
| category_id            | integer | null: false |
| item_status_id         | integer | null: false |
| shipping_fee_bearer_id | integer | null: false |
| shipping_area_id       | integer | null: false |
| ship_day_id            | integer | null: false |
| price                  | integer | null: false |

### Association

- belongs_to :users
- has_one    :buyers

## buyers テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| user_id        | integer | null: false |
| item_id        | integer | null: false |

### Association

- belongs_to :users
- belongs_to :items
- has_one    :addresses

## addresses テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| postal_code    | string  | null: false |
| prefectures_id | integer | null: false |
| municipality   | string  | null: false |
| block_number   | string  | null: false |
| apartment_name | string  |             |
| phone_number   | string  | null: false |

### Association

- belongs_to :buyers