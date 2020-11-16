# テーブル設計

## Users テーブル

|  Column          |  Type   |  Option                    |
| ---------------- | ------- | -------------------------- |
| nickname         | string  | null: false                |
| email            | string  | null: false,  unique:true  |
| password         | string  | null: false,  unique:true  |
| family_name      | string  | null: false                |
| first_name       | string  | null: false                |
| family_name_kana | string  | null: false                |
| first_name_kana  | string  | null: false                |
| birth_day        | date    | null: false                |

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
|  days_id       | integer     | null: false                    |

### Association

belong_to    :user
has_one      :purchase

## purchases テーブル

|  Column   |  Type   |  Option                         |
| ----------| ------- | ------------------------------- |
|  item     | string  | null: false, foreign_key: true  |
|  user     | string  | null: false, foreign_key: true  |

### Association

belong_to    :item
belong_to    :user
has_one      :address

## Addresses テーブル
|  Column        |  Type      |  Option                         |
| -------------- | ---------- | ------------------------------- |
| post_code      | string     | null: false                     |
| prefectures_id | integer    | null: false, foreign_key: true  |
| city           | string     | null: false                     |
| building_name  | string     | null: false                     |
| phone_number   | string     | null: false, unique: true       |
| purchase       | references | null: false, foreign_key: true  |

### Association

belong_to   :purchase

