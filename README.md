# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| name       | string | null: false |
| email      | string | null: false |
| password   | string | null: false |

### Association

- has_many :items
- has_many :orders
- has_one  :address

## items テーブル

| Column            | Type       | Options           |
| ----------------- | ---------- | ----------------- |
| item              | string     | null: false       |
| category          | string     | null: false       |
| price             | string     | null: false       |
| seller            | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column        | Type             | Options           |
| ------------- | ---------------- | ----------------- |
| buyer         | references       | foreign_key: true |
| item          | references       | foreign_key: true |


### Association

- belongs_to :user
- has_one :item
- has_one :address

## addresses テーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| address        | string     | null: false       |

### Association

- has_one :user
- has_one :order
