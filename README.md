# テーブル設計

## users テーブル

| Column          |
| --------------- |
| nickname        |
| email           |
| password        |
| last_name       |
| first_name      |
| last_name_kana  |
| first_name_kana |
| birthday        |

### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column              |
| ------------------- |
| image               |
| item_name           |
| description         |
| category            |
| item_status         |
| delivery_charge     |
| shipping_fee_bearer |
| shipping_area       |
| ship_day            |
| price               |

### Association

- belongs_to :users
- has_one    :buyers

## buyers テーブル

| Column         |
| -------------- |
| user_id        |
| item_id        |
| card_id        |
| postal_code    |
| prefectures    |
| municipality   |
| block_number   |
| apartment_name |
| phone_number   |

### Association

- belongs_to :users
- belongs_to :items