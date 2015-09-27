admin = User.create(
  name: "Alex Kirsopp",
  email: "alex@test.com",
  password: "password",
  password_confirmation: "password"
)
admin.save!
admin.update_attributes(auth_token: 0)

3.times do
  user = User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "password",
    password_confirmation: "password"
  )
  user.save!
end

users = User.all

10.times do
  list = List.create(
    title: Faker::Lorem.words(1),
    user_id: users.sample,
    permissions: ["hidden","viewable","open"].sample,
  )
  list.save!
end

lists = List.all

30.times do
  item = Item.create(
    body: Faker::Lorem.sentence,
    list_id: lists.sample,
    completion: [true,false].sample
  )
  item.save!
end

puts "#{users.count} users created"
puts "#{lists.count} lists created"
puts "#{Item.all.count} items created"

