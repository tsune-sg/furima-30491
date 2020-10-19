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
|Column  |Type      |Options                      |
|--------|----------|-----------------------------|
|name    |string    |null: false                  |
|hiragana|string    |null: false                  |
|katakana|string    |null: false                  |
|birth   |string    |null: false                  |
|user    |references|null: false,foreign_key: true|
### Association
- belongs_to :user



## merchandises

|Column     |Type      |Options                      |
|-----------|----------|-----------------------------|
|item       |string    |null: false                  |
|description|string    |null: false                  |
|category   |string    |null: false                  |
|condition  |string    |null: false                  |
|fee        |string    |null: false                  |
|from       |string    |null: false                  |
|days       |string    |null: false                  |
|price      |string    |null: false                  |
|user       |references|null: false,foreign_key: true|
### Association
- belongs_to :user
- has_one    :purchase


## purchases
|Column     |Type      |Options                      |
|-----------|----------|-----------------------------|
|user       |references|null: false,foreign_key: true|
|when       |string    |null: false                  |
|what       |string    |null: false                  |
|merchandise|references|null: false,foreign_key: true|
### Association
- has_one    :address
- belongs_to :user
- belongs_to :merchandise



## addresses
|Column  |Type      |Options                      |
|--------|----------|-----------------------------|
|postal  |string    |null: false                  |
|province|string    |null: false                  |
|city    |string    |null: false                  |
|street  |string    |null: false                  |
|phone   |string    |null: false                  |
|purchase|references|null: false,foreign_key: true|
### Association
- belongs_to :purchase