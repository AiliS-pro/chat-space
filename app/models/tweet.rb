class Tweet < ApplicationRecord
  
  belongs_to :group
  belongs_to :user
  
  validates :tweet, presence: true, unless: :image?
  mount_uploader :image, ImageUploader
end
