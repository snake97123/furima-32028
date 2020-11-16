# テーブル設計

## Users テーブル

|  Column            |  Type   |  Option                    |
| ------------------ | ------- | -------------------------- |
| nickname           | string  | null: false                |
| email              | string  | null: false,  unique:true  |
| encrypted_password | string  | null: false                |
| family_name        | string  | null: false                |
| first_name         | string  | null: false                |
| family_name_kana   | string  | null: false                |
| first_name_kana    | string  | null: false                |
| birth_day          | date    | null: false                |

### Association

has_many    :items
has_many    :purchases

## items テーブル           

|  Column        |  Type       |  Option                        |
| -------------- | ----------- | ------------------------------ |
|  name          | string      | null: false                    |
|  price         | integer     | null: false                    |
|  user          | references  | null: false, foreign_key: true |
|  description   | text        | null: false                    |
|  category_id   | integer     | null: false                    |
|  status_id     | integer     | null: false                    |
|  cost_id       | integer     | null: false                    |
|  prefecture_id | integer     | null: false                    |
|  day_id        | integer     | null: false                    |

### Association

belongs_to    :user
has_one      :purchase

## purchases テーブル

|  Column   |  Type       |  Option                         |
| ----------| ----------- | ------------------------------- |
|  item     | references  | null: false, foreign_key: true  |
|  user     | references  | null: false, foreign_key: true  |

### Association

belongs_to    :item
belongs_to    :user
has_one      :address

## Addresses テーブル
|  Column        |  Type      |  Option                         |
| -------------- | ---------- | ------------------------------- |
| post_code      | string     | null: false                     |
| prefecture_id  | integer    | null: false                     |
| city           | string     | null: false                     |
| building_name  | string     |                                 |
| phone_number   | string     | null: false                     |
| purchase       | references | null: false, foreign_key: true  |

### Association

belongs_to   :purchase

