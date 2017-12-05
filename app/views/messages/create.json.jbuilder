json.message do
  json.name @message.user.name
  json.image @message.image.url
  json.created_at @message.created_at.to_s(:published_on)
  json.text @message.text
end
