json.array! @tweets do |tweet|
  json.tweet tweet.tweet
  json.image tweet.image.url
  json.created_at tweet.created_at.strftime("%Y年%m月%d日 %H時%M分")
  json.user_name tweet.user.name
  json.id tweet.id
end