class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  has_many :tweets
  validates :name, presence: true, uniqueness: true

  def show_last_tweet
    if (last_tweet = tweets.last).present?
      if last_tweet.tweet?
        last_tweet.tweet
      else
        '画像が投稿されています'
      end
    else
      'まだメッセージはありません。'
    end
  end

end
