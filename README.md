# テーブル設計

## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false              |
| email              | string | null: false unique: true |
| encrypted_password | string | null: false              |
| firstname          | string | null: false              |
| lastname           | string | null: false              |
| firstname_kana     | string | null: false              |
| lastname_kana      | string | null: false              |
| birthday           | date   | null: false              |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column            | Type       | Options           |
| ----------------- | ---------- | ----------------- |
| item              | string     | null: false       |
| description       | text       | null: false       |
| price             | integer    | null: false       |
| condition_id      | integer    | null: false       |
| shipping_id       | integer    | null: false       |
| area_id           | integer    | null: false       |
| day_id            | integer    | null: false       |
| category_id       | integer    | null: false       |
| user              | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column        | Type             | Options           |
| ------------- | ---------------- | ----------------- |
| user          | references       | foreign_key: true |
| item          | references       | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| postcode       | string     | null: false       |
| area_id        | integer    | foreign_key: true |
| municipalities | string     | null: false       |
| address        | string     | null: false       |
| building       | string     |                   |
| phone          | string     | null: false       |
| order          | references | foreign_key: true |

### Association

- belongs_to :order



https://gyazo.com/71841f6fe7d222dd4f3d333bd88cc69e
https://gyazo.com/4286b1034f50a57f56ccc770c81d0050
https://gyazo.com/d0b43e4f29cdc41a22fe8463062c7ade

https://gyazo.com/bf94b5e3b8fdca844dfc4608aa187d77