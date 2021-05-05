# テーブル設計

## users テーブル

| Column             | Type   | Options      |
| ------------------ | ------ | ------------ |
| nickname           | string | null: false  |
| email              | string | unique: true |
| encrypted_password | string | null: false  |
| firstname          | string | null: false  |
| lastname           | string | null: false  |
| firstname_kana     | string | null: false  |
| lastname_kana      | string | null: false  |
| birthday           | date   | null: false  |

### Association

- has_many :items
- has_many :orders
- has_one  :address

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
- has_one :item
- has_one :address

## addresses テーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| postcode       | string     | null: false       |
| prefectures_id | integer    | null: false       |
| municipalities | string     | null: false       |
| address        | string     | null: false       |
| building       | string     |                   |
| phone          | string     | null: false       |

### Association

- belongs_to :order