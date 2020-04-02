require 'rails_helper'

RSpec.describe Tweets, type: :model do
  describe '#create' do
    context 'can save' do
      it 'is valid with tweet' do
        expect(build(:tweets, image: nil)).to be_valid
      end

      it 'is valid with image' do
        expect(build(:tweets, tweet: nil)).to be_valid
      end

      it 'is valid with tweet and image' do
        expect(build(:tweets)).to be_valid
      end
    end

    context 'can not save' do
      it 'is invalid with tweet and image' do
        tweet = build(:tweets, tweet: nil, image: nil)
        tweet.valid?
        expect(tweet.errors[:tweet]).to include("を入力してください")
      end

      it 'is invalid without group_id' do
        tweet = build(:tweets, group_id: nil)
        tweet.valid?
        expect(tweet.errors[:group]).to include("を入力してください")
      end

      it 'is invalid without user_id' do
        tweet = build(:tweets, user_id: nil)
        tweet.valid?
        expect(tweet.errors[:user]).to include("を入力してください")
      end
    end
  end
end