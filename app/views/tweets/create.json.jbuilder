json.user_name @tweet.user.name
json.created_at @tweet.created_at.strftime("%Y年%m月%d日 %H時%M分")
json.tweet @tweet.tweet
json.image @tweet.image_url
json.id @tweet.id