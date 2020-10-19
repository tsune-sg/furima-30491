## users
|Column            |Type      |Options                      |
|------------------|----------|-----------------------------|
|nickname          |string    |null: false                  |
|email             |string    |null: false,unique: true     |
|password          |string    |null: false                  |
|firstname         |string    |null: false                  |
|lastname          |string    |null: false                  |
|firstname_furigana|string    |null: false                  |
|lastname_furigana |string    |null: false                  |
|birth             |date      |null: false                  |
### Association
- has_many :items
- has_many :purchases


## items

|Column        |Type      |Options                      |
|--------------|----------|-----------------------------|
|name          |string    |null: false                  |
|description   |text      |null: false                  |
|category_id   |integer   |null: false                  |
|condition_id  |integer   |null: false                  |
|fee_id        |integer   |null: false                  |
|from_id       |integer   |null: false                  |
|days_id       |integer   |null: false                  |
|price         |integer   |null: false                  |
|user          |references|null: false,foreign_key: true|
### Association
- belongs_to :user
- has_one    :purchase


## purchases
|Column        |Type      |Options                      |
|--------------|----------|-----------------------------|
|user          |references|null: false,foreign_key: true|
|item          |references|null: false,foreign_key: true|
### Association
- has_one    :address
- belongs_to :user
- belongs_to :item



## addresses
|Column     |Type      |Options                      |
|-----------|----------|-----------------------------|
|postal     |string    |null: false                  |
|province_id|integer   |null: false                  |
|city       |string    |null: false                  |
|street     |string    |null: false                  |
|building   |string    |                             |
|phone      |string    |null: false                  |
|purchase   |references|null: false,foreign_key: true|
### Association
- belongs_to :purchase