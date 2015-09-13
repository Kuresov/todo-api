json.user do
  json.id user.id
  json.email user.email
end

json.lists do
  json.array! lists do |list|
    json.listid list.id
    json.title list.title
  end
end
