# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| last-name       | string  | null: false |
| first-name      | string  | null: false |
| last-name-kana  | string  | null: false |
| first-name-kana | string  | null: false |
| birth-date      | integer | null: false |

### Association

- has_many :purchases
- has_many :products


## products テーブル

| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| name                | string  | null: false |
| info                | text    | null: false |
| category            | integer | null: false |
| sales-status        | integer | null: false |
| shipping-fee-status | integer | null: false |
| prefecture          | integer | null: false |
| scheduled-delivery  | integer | null: false |
| price               | string  | null: false |

### Association
- belongs_to :user
- belongs_to :purchase


## purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |

### Association
- has_one :user
- belongs_to :product
- belongs_to :address


## addresses テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| postal-code  | string  | null: false |
| prefecture   | integer | null: false |
| city         | string  | null: false |
| address      | string  | null: false |
| building     | string  |             |
| phone-number | string  | null: false |

### Association
- belongs_to :purchase
