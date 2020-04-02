FactoryBot.define do
  factory :tweet do
    tweet {Faker::Lorem.sentence}
    image {File.open("#{Rails.root}/public/images/test_image.jeg.jpeg")}
    user
    group
  end
end