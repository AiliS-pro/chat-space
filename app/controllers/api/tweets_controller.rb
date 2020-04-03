class Api::TweetsController < ApplicationController
  def index
    group = Group.find(params[:group_id])
    last_tweet_id = params[:id].to_i
    @tweets = group.tweets.includes(:user).where("id > ?", last_tweet_id)
  end
end