# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| last_name       | string  | null: false |
| first_name      | string  | null: false |
| last_name_kana  | string  | null: false |
| first_name_kana | string  | null: false |
| birthday        | date    | null: false |

### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column                 | Type       |     Options                   |
| ---------------------- | ---------- | ----------------------------- |
| name                   | string     | null: false                   |
| description            | text       | null: false                   |
| category_id            | integer    | null: false                   |
| status_id              | integer    | null: false                   |
| shipping_fee_bearer_id | integer    | null: false                   |
| shipping_area_id       | integer    | null: false                   |
| ship_day_id            | integer    | null: false                   |
| price                  | integer    | null: false                   |
| user                   | references | null: false,foreign_key: true |

### Association

- belongs_to :user
- has_one    :buyer

## buyers テーブル

| Column  | Type       | Options                       |
| ------- | ---------- | ----------------------------- |
| user    | references | null: false,foreign_key: true |
| item    | references | null: false,foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

## addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefectures_id | integer    | null: false                    |
| municipality   | string     | null: false                    |
| block_number   | string     | null: false                    |
| apartment_name | string     |                                |
| phone_number   | string     | null: false                    |
| buyer          | references | null: false ,foreign_key: true |

### Association

- belongs_to :buyer