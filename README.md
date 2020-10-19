## users
|Column  |Type  |Options                 |
|--------|------|------------------------|
|nickname|string|null: false             |
|email   |string|null: false,unique: true|
|password|string|null: false             |
### Association
- has_many :merchandises
- has_many :purchases
- has_one  :profile


## profiles
|Column            |Type      |Options                      |
|------------------|----------|-----------------------------|
|firstname         |string    |null: false                  |
|lastname          |string    |null: false                  |
|firstname_furigana|string    |null: false                  |
|lastname_furigana |string    |null: false                  |
|birth             |date      |null: false                  |
### Association
- has_one :user



## items

|Column     |Type      |Options                      |
|-----------|----------|-----------------------------|
|item_name  |string    |null: false                  |
|description|string    |null: false                  |
|category   |integer   |null: false                  |
|condition  |integer   |null: false                  |
|fee        |integer   |null: false                  |
|from       |integer   |null: false                  |
|days       |integer   |null: false                  |
|price      |integer   |null: false                  |
|user_id    |references|null: false,foreign_key: true|
### Association
- belongs_to :user
- has_one    :purchase


## purchases
|Column        |Type      |Options                      |
|--------------|----------|-----------------------------|
|user          |references|null: false,foreign_key: true|
### Association
- has_one    :address
- belongs_to :user



## addresses
|Column  |Type      |Options                      |
|--------|----------|-----------------------------|
|postal  |string    |null: false                  |
|province|integer   |null: false                  |
|city    |string    |null: false                  |
|street  |string    |null: false                  |
|building|string    |null: false                  |
|phone   |string    |null: false                  |
|purchase|references|null: false,foreign_key: true|
### Association
- belongs_to :purchase