# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|


### Association
- has_many :tweets
- has_many :users_groups

## tweetsテーブル
|Column|Type|Options|
|------|----|-------|
|tweet|text|null: false|
|image|blob|
|user_id|integer|foreign_key: true|
|group_id|integer|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :group


## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|group_name|text|null: false|

### Association
- has_many :tweets
- has_many :users_groups


## users_groupsテーブル
|Column|Type|Option|
|------|----|------|
|users_id|integer|foreign_key: true|
|groups_id|integer|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :group
