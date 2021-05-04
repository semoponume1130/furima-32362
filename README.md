# テーブル設計

## users テーブル

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| nickname      | string | null: false |
| email         | string | null: false |
| password      | string | null: false |
| firstname     | string | null: false |
| lastname      | string | null: false |
| firstnamekana | string | null: false |
| lastnamekana  | string | null: false |
| birthday      | string | null: false |

### Association

- has_many :items
- has_many :orders
- has_one  :address

## items テーブル

| Column            | Type       | Options           |
| ----------------- | ---------- | ----------------- |
| item              | string     | null: false       |
| description       | text       | null: false       |
| price             | string     | null: false       |
| condition         | string     | null: false       |
| shipping          | string     | null: false       |
| area              | string     | null: false       |
| day               | string     | null: false       |
| category          | string     | null: false       |
| nickname          | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column        | Type             | Options           |
| ------------- | ---------------- | ----------------- |
| nickname      | references       | foreign_key: true |
| item          | references       | foreign_key: true |

### Association

- belongs_to :user
- has_one :item
- has_one :address

## addresses テーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| postcode       | string     | null: false       |
| prefectures    | string     | null: false       |
| municipalities | string     | null: false       |
| address        | string     | null: false       |
| building       | string     | null: true        |
| phone          | string     | null: false       |

### Association

- has_one :order